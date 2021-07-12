docker build -f Dockerfile -t vda/adtech_socket .
docker save vda/adtech_socket:latest > adtech_socket.tar
scp adtech_socket.tar centos@ads-w1:/home/centos/app