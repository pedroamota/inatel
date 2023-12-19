# Trabalho DevOps

Nome: Pedro Augusto da Luz Mota
Curso: GES

1. Montar imagem:

```
docker build -t dockerfile .  
```

2. Iniciar:
   
Subir container
```
docker run --name jenkins_flutter -p 8080:8080 -p 50000:50000 dockerfile
```
Subir com docker-compose
```
docker-compose -f docker-compose.yaml up
```
