package br.inatel.projeto.poo;

import br.inatel.projeto.poo.controller.Axie;
import br.inatel.projeto.poo.controller.Conta;
import br.inatel.projeto.poo.controller.Jogador;
import br.inatel.projeto.poo.controller.Supervisor;
import br.inatel.projeto.poo.model.*;
import com.mysql.management.util.Str;

import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        ContaBD b = new ContaBD();
        Scanner sc = new Scanner(System.in);
        String txt;
        int inter;

        System.out.println("Antes de tudo, adicione sua primeira conta\n");
        System.out.print("Digite o Nickname da conta: ");
        txt = sc.next();
        Conta c = new Conta();
        c.setNickname(txt);
        System.out.print("Digite a senha da conta: ");
        txt = sc.next();
        c.setPassword(txt);
        b.insertConta(c);

        System.out.println("\n\n------------MENU-------------");
        System.out.println("Escolha o que deseja gerenciar\n");
        System.out.println("(1) - Axie");
        System.out.println("(2) - Conta");
        System.out.println("(3) - Jogador");
        System.out.println("(4) - Supervisor");

        inter = sc.nextInt();
        switch (inter){
            case 1:
                mAxie();
                break;
            case 2:
                mConta();
                break;
            case 3:
                mJoga();
                break;
            case 4:
                mSup();
                break;
        }
    }
    public static void mAxie(){
        AxieBD b = new AxieBD();
        Scanner sc = new Scanner(System.in);
        String txt;
        String txt1;
        int inter;

        System.out.println("O que vccê deseja fazer?\n");
        System.out.println("(1) - Inserir um novo Axie");
        System.out.println("(2) - Lista de Axies");
        System.out.println("(5) - Deletar Axie");

        inter = sc.nextInt();
        switch (inter){
            case 1:
                Axie a = new Axie();
                System.out.println("INSERIR NOVO AXIE\n");
                System.out.print("Nome: ");
                a.setNome(sc.next());
                System.out.print("Tipo: ");
                a.setTipo(sc.next());
                System.out.print("Poder: ");
                a.setPoder(sc.next());
                System.out.println("Nome da conta a adicionalo:");
                txt = sc.next();
                b.insertAxie(a,txt);
                break;

            case 2:
                ArrayList<Axie> lista = new ArrayList<>();
                System.out.println("LISTA DE AXIES\n");
                System.out.print("Deseja ver os axies de qual conta? ");
                txt = sc.next();
                lista = b.listaAxie(txt);
                for(int i=0;i<lista.size();i++){
                    System.out.print("\nAxie: ");
                    lista.get(i);
                }
                break;

            case 3:
                System.out.println("DELETAR UM AXIE\n");
                System.out.print("Pertence a qual conta? ");
                txt1 = sc.next();
                System.out.print("nome: ");
                txt = sc.next();
                b.deleteAxie(txt,txt1);

                break;
        }

    }
    public static void mConta(){
        ContaBD c = new ContaBD();
        Scanner sc = new Scanner(System.in);
        String txt;
        String txt1;
        int inter;

        System.out.println("O que vccê deseja fazer?\n");
        System.out.println("(1) - Inserir uma nova conta");
        System.out.println("(2) - Lista de contas");
        System.out.println("(3) - Mudar Nickname");
        System.out.println("(4) - Mudar senha");
        System.out.println("(5) - Deletar conta");

        inter = sc.nextInt();
        switch (inter){
            case 1:
                Conta aux = new Conta();
                System.out.println("ADICIONAR NOVA CONTA\n");
                System.out.print("Nome: ");
                aux.setNickname(sc.next());
                System.out.print("Senha: ");
                aux.setPassword(sc.next());
                break;

            case 2:
                ArrayList<String> lista = new ArrayList<>();
                System.out.println("LISTAR TODAS AS CONTAS\n");

                lista = c.listaConta();
                for(int i=0;i<lista.size();i++){
                    System.out.print("Conta: ");
                    lista.get(i);
                }

                break;

            case 3:
                System.out.println("MUDAR NICKNAME\n");
                System.out.print("Digite nome da conta: ");
                txt = sc.next();
                System.out.print("Digite o novo Nickname: ");
                txt1 = sc.next();
                c.mudarNickname(txt, txt1);
                break;

            case 4:
                System.out.println("MUDAR SENHA\n");
                System.out.print("Digite nome da conta: ");
                txt = sc.next();
                System.out.print("Digite a nova senha: ");
                txt1 = sc.next();
                c.mudarSenha(txt, txt1);
                break;

            case 5:
                System.out.println("DELETAR CONTA\n");
                System.out.print("Digite o nome da conta que deseja deletar: ");
                txt = sc.next();
                c.deleteConta(txt);
                break;
        }
    }
    public static void mJoga(){
        JogadorBF b = new JogadorBF();
        Scanner sc = new Scanner(System.in);
        String txt;
        String txt1;
        int inter;

        System.out.println("O que você deseja fazer?\n");
        System.out.println("(1) - Inserir um novo jogador");
        System.out.println("(2) - Buscar um Jogador");
        System.out.println("(3) - Mudar conta do Jogador");
        System.out.println("(4) - Listar Jogadores");
        System.out.println("(5) - Definir um supervisor responsavel");
        System.out.println("(6) - Deletar jogador");

        inter = sc.nextInt();
        switch (inter){
            case 1:
                Jogador a = new Jogador();
                System.out.println("INSERIR NOVO JOGADOR\n");
                System.out.print("Nome: ");
                a.setNome(sc.next());
                System.out.print("CPF: ");
                a.setCpf(sc.next());
                System.out.print("Telefone: ");
                a.setTelefone(sc.next());
                System.out.print("Idade: ");
                a.setIdade(sc.nextInt());
                System.out.print("Lucro(%): ");
                a.setLucro(sc.nextInt());
                System.out.println("Nome da conta:");
                txt = sc.next();
                b.addJogador(a, txt);
                break;

            case 2:
                System.out.println("BUSCAR JOGADOR\n");
                System.out.println("Digite o CPF: ");
                txt = sc.next();
                a = b.buscarJogador(txt);
                System.out.println("Nome "+ a.getNome());
                System.out.println("Telefone: "+ a.getTelefone());
                System.out.println("Idade: "+ a.getIdade());
                System.out.println("Lucro "+a.getLucro()+"%");
                break;

            case 3:
                System.out.println("MUDAR CONTA DO JOGADOR\n");
                System.out.print("CPF do jogador: ");
                txt = sc.next();
                System.out.print("Nova conta: ");
                txt1 = sc.next();
                b.updateContaJogador(txt, txt1);
                break;

            case 4:
                ArrayList<Jogador> lista = new ArrayList<>();
                System.out.println("LISTA DE JOGADORES\n");
                lista = b.listaJogador();
                for(int i=0;i<lista.size();i++){
                    System.out.print("\nJogador: ");
                    lista.get(i);
                }
                break;
            case 5:
                Sup_has_jogador shj = new Sup_has_jogador();

                System.out.print("Digite o CPF do jogador: ");
                txt1 = sc.next();
                System.out.print("Digite o CPF do supervisor: ");
                txt = sc.next();
                shj.sup_has_jogador(txt1,txt);
                break;

            case 6:
                System.out.println("DELETAR UM JOGADOR\n");
                System.out.print("CPF do jogador: ");
                txt = sc.next();
                b.deleteJogador(txt);
                break;
        }

    }
    public static void mSup(){
        Scanner sc = new Scanner(System.in);
        SupervisorBD b = new SupervisorBD();
        String txt;
        String txt1;
        int inter;
        double doub;

        System.out.println("O que vccê deseja fazer?\n");
        System.out.println("(1) - Adicionar novo Supervisor");
        System.out.println("(2) - Buscar um Supervisor");
        System.out.println("(3) - Mudar Salario");
        System.out.println("(4) - Lista de Supervisores");
        System.out.println("(5) - Ser Responsavel de um jogador");
        System.out.println("(6) - Deletar Supervisor");

        inter = sc.nextInt();
        switch (inter){
            case 1:
                Supervisor a = new Supervisor();
                System.out.println("INSERIR NOVO SUPERVISOR\n");
                System.out.print("Nome: ");
                a.setNome(sc.next());
                System.out.print("CPF: ");
                a.setCpf(sc.next());
                System.out.print("Telefone: ");
                a.setTelefone(sc.next());
                System.out.print("Idade: ");
                a.setIdade(sc.nextInt());
                System.out.print("Horas de trabalho p/ semana: ");
                a.setHoras_semana(sc.nextInt());
                System.out.print("Salario: ");
                a.setSalario(sc.nextDouble());
                b.addSupervisor(a);
                break;

            case 2:
                Supervisor a1 = new Supervisor();
                System.out.println("BUSCAR SUPERVISOR\n");
                System.out.println("Digite o CPF: ");
                txt = sc.next();
                a = b.buscarSupervisor(txt);
                System.out.println("Nome "+ a.getNome());
                System.out.println("Telefone: "+ a.getTelefone());
                System.out.println("Idade: "+ a.getIdade());
                System.out.println("Salario: "+a.getSalario());
                break;

            case 3:
                System.out.println("MUDAR SALARIO DO SUPERVISOR\n");
                System.out.print("CPF do Supervisor: ");
                txt = sc.next();
                System.out.print("Novo Salario: ");
                doub = sc.nextDouble();
                b.updateSalarioSupervisor(txt, doub);
                break;

            case 4:
                ArrayList<Supervisor> lista = new ArrayList<>();
                System.out.println("LISTA DE SUPERVISORES\n");
                lista = b.listSup();
                for(int i=0;i<lista.size();i++){
                    System.out.print("\nSupervisor: ");
                    lista.get(i);
                }
                break;

            case 5:
                Sup_has_jogador shj = new Sup_has_jogador();

                System.out.print("Digite o CPF do supervisor: ");
                txt = sc.next();
                System.out.print("Digite o CPF do jogador: ");
                txt1 = sc.next();
                shj.sup_has_jogador(txt1,txt);
                break;

            case 6:
                System.out.println("DELETAR UM SUPERVISOR\n");
                System.out.print("CPF do supervisor: ");
                txt = sc.next();
                b.deleteSupervisor(txt);
                break;
        }

    }

}
