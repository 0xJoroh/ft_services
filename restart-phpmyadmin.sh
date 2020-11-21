kubectl delete deployment phpmyadmin-deployment
docker rmi -f phpmyadmin-img
docker build -t phpmyadmin-img ./srcs/phpmyadmin/
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
minikube service phpmyadmin-service --url
