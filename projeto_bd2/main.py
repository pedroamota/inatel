import email
from pprintpp import pprint as pp
from db.database import Graph


class Pessoa:

    def setUser(self, nome, telefone, email, idade):
        self.name = nome
        self.telefone = telefone
        self.email = email
        self.idade = idade

    def getName(self):
        return self.name
    def getTelefone(self):
        return self.telefone
    def getEmail(self):
        return self.email
    def getIdade(self):
        return self.idade

    def setName(self, nome):
        self.user = nome

class Notes(object):
    def __init__(self):
        self.db = Graph(uri='bolt://3.231.93.132:7687',
                        user='neo4j', password='enemy-staff-stitch')

    #CREATE
    def insertTasks(self, user, tarefas):
        self.db.execute_query('CREATE (t:Task {tarefa:$tarefa}) return t',
                              {'tarefa': tarefas['tarefa']})

        self.db.execute_query(
            'MATCH(t:Task {tarefa: $tarefa}),(u:User{name:$name})'
            'CREATE(u)-[:POSSUI]->(t) RETURN t,u', 
            {'tarefa': tarefas['tarefa'], 'name': user['name']})
        return "Tarefa Criada"

    def insertNotes(self, user, notas):
        self.db.execute_query('CREATE (n:Note {titulo:$titulo, texto:$texto})',
                              {'titulo': notas['titulo'], 'texto': notas['texto']})

        self.db.execute_query(
            'MATCH(n:Note {titulo:$titulo}),(u:User{name:$name})'
            'CREATE(u)-[:POSSUI]->(n)', {'titulo': notas['titulo'], 'texto': notas['texto'], 'name': user['name']})
        return "Anotação Criada"

    def createUser(self, user): 
        self.db.execute_query('CREATE (:User {name:$name, email:$email, telefone:$telefone, idade:$idade})',#
                              {'name': user['name'], 'email': user['email'], 'telefone': user['telefone'], 'idade': user['idade']})
        return "Usuário Criado"
                
    #READ
    def readTasks(self, user):
        return self.db.execute_query('MATCH (u:User {name:$name})--(t:Task) RETURN t',
                                     {'name': user['name']})

    def readNotes(self, user):
        return self.db.execute_query('MATCH (u:User {name:$name})--(n:Note) RETURN n',
                                     {'name': user['name']})
        

    #UPDATE
    def updateNotes(self, notas):
        self.db.execute_query(
            'MATCH (n:Note {titulo:$titulo}) SET n.texto = $texto',
            {'titulo': notas['titulo'],'texto': notas['texto']})

        return "Nota Atualizada"
        
    
    def updateTasks(self, tarefas):
        self.db.execute_query(
            'MATCH (t:Task {tarefa:$tarefa}) SET t.tarefa = $newTarefa',
                                     {'tarefa': tarefas['tarefa'], 'newTarefa': tarefas['newTarefa']})
        return "Tarefa atualizada"
    #DELETE
    def deleteTask(self, tarefas):
        self.db.execute_query('MATCH (t:Task {tarefa:$tarefa}) DETACH DELETE t',
                              {'tarefa': tarefas['tarefa']})    
        return "Tarefa Deletada"  

    def deleteNotes(self, notas):
        self.db.execute_query('MATCH (n:Note {titulo:$titulo}) DETACH DELETE n',
                              {'titulo': notas['titulo']})
        return "Nota Deletada"


def divider():
    print('\n' + '-' * 80 + '\n')


client = Notes()
usuario = Pessoa()
nameAux = ""

while 1:
    print("\n\n-----------------------------------")
    create = input("Já possui usuário? (S/N)\n")

    if(create == 's' or create == 'S'):
        name = input("Digite o nome do seu usuário: ")
        nameAux = {'name':name}
        print(usuario.setName(name))
    else:
        print("\n\n CADASTRO \n")
        name = input("name: ")
        email = input("email: ")
        telefone = input("telefone: ")
        idade = input("idade: ")
        nameAux = {'name':name}
        usuario.setUser(name, email, telefone, idade)
        aux  = {
            'name': name,
            'email': email,
            'telefone': telefone,
            'idade': idade,
        }
        client.createUser(aux)

    print("-----------------------------------")
    option = input("1 - Escrever\n2 - Pesquisar\n3 - Update\n4 - Delete\n")
    print("-----------------------------------")

    if(option == '1'):
        textIn = input("1 - Notas\n2 - Tarefas\n")

        if(textIn == '1'):
            titulo = input("Titulo da anotação: ")
            texto = input("Texto da anotação: ")
            anotacao = {
                'titulo': titulo,
                'texto': texto
            }
            client.insertNotes(nameAux, anotacao)

        elif(textIn == '2'):
            tarefa = input("Digite a sua tarefa: ")
            task = {'tarefa': tarefa}
            client.insertTasks(nameAux, task)

        else:
            print("Nenhuma opção selecionada")

    elif(option == '2'):
        textIn = input("1 - Notas\n2 - Tarefas\n")
        print("-----------------------------------\n")
        if(textIn == '1'):
            print("Todas as Anotações\n")
            aux = client.readNotes(nameAux)
            pp(aux)
            divider()

        elif(textIn == '2'):
            print("Todas as Tarefas\n")
            aux = client.readTasks(nameAux)
            pp(aux)
            divider()

        else:
            print("Nenhuma opção selecionada")

    #update
    elif(option == '3'):
        textIn = input("1 - Notas\n2 - Tarefas\n")
        if(textIn == '2'):
            t1 = input("Deseja atualizar qual tarefa? ")
            t2 = input("Digite a nova tarefa: ")
            task = {
                'tarefa': t1,
                'newTarefa': t2
            }
            print(client.updateTasks(task))


        elif(textIn == '1'):
            t1 = input("Titulo da anotação? ")
            t2 = input("Nova anotação: ")
            notes={
                'titulo':t1,
                'texto':t2
            }
            print(client.updateNotes(notes))

        else:
            print("Nenhuma opção selecionada")

    #delete
    elif(option == '4'):
        textIn = input("1 - Notas\n2 - Tarefas\n")
        if(textIn == '1'):
            titulo = input("Titulo da anotação a ser deletada? ")
            notes = {'titulo':titulo}
            print(client.deleteNotes(notes))

        elif(textIn == '2'):
            tarefa = input("Deseja deletar qual tarefa? ")
            task = {'tarefa':tarefa}
            print(client.deleteTask(task))

        else:
            print("Nenhuma opção selecionada")

    else: print("Opção invalida!")

client.db.close()
