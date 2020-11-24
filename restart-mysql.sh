kubectl delete deployment mysql-deployment
kubectl delete svc mysql-service
kubectl delete pvc mysql-pv-claim
docker rmi -f mysql-img
docker build -t mysql-img ./srcs/mysql/
kubectl apply -f ./srcs/mysql/mysql.yaml
