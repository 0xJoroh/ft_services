# kubectl delete pods --all
# kubectl delete deployments --all
# kubectl delete svc --all
# kubectl delete pvc --all
minikube delete
minikube start --driver=virtualbox --memory 3072

eval $(minikube -p minikube docker-env)
docker build -t nginx-img        ./srcs/Nginx/
docker build -t mysql-img        ./srcs/MySQL/
docker build -t phpmyadmin-img   ./srcs/phpMyAdmin/
docker build -t wordpress-img    ./srcs/WordPress/
docker build -t ftps-img         ./srcs/FTPS/
docker build -t grafana-img      ./srcs/Grafana/
docker build -t influxdb-img      ./srcs/InfluxDB/

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/phpMyAdmin/phpmyadmin.yaml
kubectl apply -f ./srcs/Wordpress/wordpress.yaml
kubectl apply -f ./srcs/FTPS/ftps.yaml
kubectl apply -f ./srcs/Grafana/grafana.yaml
kubectl apply -f ./srcs/InfluxDB/InfluxDB.yaml
kubectl apply -f ./srcs/metallb_conf.yaml

minikube dashboard &
