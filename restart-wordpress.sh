kubectl delete deployment wordpress-deployment
docker rmi -f wordpress-img
docker build -t wordpress-img ./srcs/wordpress/
kubectl apply -f ./srcs/wordpress/wordpress.yaml
minikube service wordpress-service --url
