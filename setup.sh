docker build -t nginx-img      ./srcs/nginx/
docker build -t mysql-img      ./srcs/mysql/
docker build -t phpmyadmin-img ./srcs/phpmyadmin/
docker build -t wordpress-img  ./srcs/wordpress/

kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
