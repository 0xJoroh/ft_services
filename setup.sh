if [[ $(minikube status | grep -c "Running") == 0 ]]
then
    minikube start --driver=virtualbox
    # minikube addons enable metrics-server
    # minikube addons enable dashboard
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
else
    kubectl delete pods --all
    kubectl delete deployments --all
    kubectl delete svc --all
    kubectl delete pvc --all
fi
eval $(minikube -p minikube docker-env)
docker build -t nginx-img        ./srcs/Nginx/
docker build -t mysql-img        ./srcs/MySQL/
docker build -t phpmyadmin-img   ./srcs/Phpmyadmin/
docker build -t wordpress-img    ./srcs/WordPress/
docker build -t ftps-img         ./srcs/FTPS/
docker build -t grafana-img      ./srcs/Grafana/
docker build -t influxdb-img      ./srcs/InfluxDB/

kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/FTPS/ftps.yaml
kubectl apply -f ./srcs/Grafana/grafana.yaml
kubectl apply -f ./srcs/InfluxDB/InfluxDB.yaml
kubectl apply -f ./srcs/metallb_conf.yaml

minikube dashboard &

# kubectl delete -f ./srcs/InfluxDB/InfluxDB.yaml ; docker rmi influxdb-img ; docker build -t influxdb-img      ./srcs/InfluxDB/ ; kubectl apply -f ./srcs/InfluxDB/InfluxDB.yaml
# kubectl delete -f ./srcs/grafana/grafana.yaml ; docker rmi grafana-img ; docker build -t grafana-img      ./srcs/grafana/ ; kubectl apply -f ./srcs/grafana/grafana.yaml
# kubectl delete -f ./srcs/mysql/mysql.yaml ; docker rmi mysql-img ; docker build -t mysql-img      ./srcs/mysql/ ; kubectl apply -f ./srcs/mysql/mysql.yaml
# kubectl delete -f ./srcs/nginx/nginx.yaml ; docker rmi nginx-img ; docker build -t nginx-img      ./srcs/nginx/ ; kubectl apply -f ./srcs/nginx/nginx.yaml
# kubectl delete -f ./srcs/phpmyadmin/phpmyadmin.yaml ; docker rmi phpmyadmin-img ; docker build -t phpmyadmin-img      ./srcs/phpmyadmin/ ; kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
# kubectl delete -f ./srcs/wordpress/wordpress.yaml ; docker rmi wordpress-img ; docker build -t wordpress-img      ./srcs/wordpress/ ; kubectl apply -f ./srcs/wordpress/wordpress.yaml
# kubectl delete -f ./srcs/ftps/ftps.yaml ; docker rmi ftps-img ; docker build -t ftps-img      ./srcs/ftps/ ; kubectl apply -f ./srcs/ftps/ftps.yaml
# kubectl delete -f ./srcs/metallb_conf.yaml ; kubectl apply -f ./srcs/metallb_conf.yaml
