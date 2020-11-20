kubectl delete deployment wordpress-deployment
# kubectl delete service wordpress-service
# kubectl delete pvc wp-pv-claim
docker rmi -f wordpress-img

docker build -t wordpress-img  ./srcs/wordpress/
kubectl apply -f ./srcs/wordpress/wordpress.yaml
echo "WordPress Service"
minikube service wordpress-service --url
