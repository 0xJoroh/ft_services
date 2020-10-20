docker build ./srcs/nginx/ -t nginx-img
kubectl apply -f ./srcs/nginx/nginx.yaml
