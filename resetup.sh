kubectl delete pods --all
kubectl delete deployments --all
kubectl delete svc --all
kubectl delete pvc --all
# docker rmi -f $(docker images -aq)
docker rmi -f mysql-img
sh setup.sh
