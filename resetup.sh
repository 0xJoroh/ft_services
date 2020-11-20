kubectl delete pods --all
kubectl delete deployments --all
kubectl delete svc --all
kubectl delete pvc --all
docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -aq)
sh setup.sh
