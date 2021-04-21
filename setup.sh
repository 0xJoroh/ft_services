if [[ $(minikube status | grep -c "Running") == 0 ]]
then
    minikube start --extra-config=apiserver.service-node-port-range=1-35000
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
docker build -t nginx-img        ./srcs/nginx/
docker build -t mysql-img        ./srcs/mysql/
docker build -t phpmyadmin-img   ./srcs/phpmyadmin/
docker build -t wordpress-img    ./srcs/wordpress/
docker build -t ftps-img         ./srcs/FTPS/

kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/FTPS/ftps.yaml
kubectl apply -f ./srcs/metallb_conf.yaml

