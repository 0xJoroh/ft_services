kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# docker build -t nginx-img        ./srcs/nginx/
docker build -t mysql-img        ./srcs/mysql/
# docker build -t phpmyadmin-img   ./srcs/phpmyadmin/
docker build -t wordpress-img    ./srcs/wordpress/

kubectl apply -f ./srcs/metallb_conf.yml
kubectl apply -f ./srcs/mysql/mysql.yaml
# kubectl apply -f ./srcs/nginx/nginx.yaml
# kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml

# echo "Nginx Service"
# minikube service nginx-service --url
# echo "PhpMyAdmin Service"
# minikube service phpmyadmin-service --url
# echo "WordPress Service"
minikube service wordpress-service --url
