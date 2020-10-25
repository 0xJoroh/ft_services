# brew install minikube docker
# export MINIKUBE_HOME=/goinfre/$(whoami)
# minikube start --vm-driver=virtualbox
# eval $(minikube -p minikube docker-env)

docker build -t nginx-img      ./srcs/nginx/
# docker build -t mysql-img      ./srcs/mysql/
# docker build -t phpmyadmin-img ./srcs/phpmyadmin/
docker build -t wordpress-img  ./srcs/wordpress/

kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml

echo "Nginx Service"
minikube service nginx-service --url
echo "PhpMyAdmin Service"
minikube service phpmyadmin-service --url
echo "WordPress Service"
minikube service wordpress-service --url
