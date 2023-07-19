!#/bin/bash

echo "Criando as imagens"

docker build -t hedgaraws/projeto-backend:1.0 backend/.
docker build -t hedgaraws/projeto-database:1.0 database/.

echo "Realizando o push das imagens"

docker push hedgaraws/projeto-backend:1.0
docker push hedgaraws/projeto-database:1.0

echo "Criando serviços no cluster kubernetes"

kubectl.exe apply -f ./services.yml

echo "Criando os deployments"

kubectl.exe apply -f ./deployment.yml

