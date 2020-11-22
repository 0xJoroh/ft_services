kubectl delete deployment mysql-deployment
docker rmi -f mysql-img
docker build -t mysql-img ./srcs/mysql/
kubectl apply -f ./srcs/mysql/mysql.yaml
