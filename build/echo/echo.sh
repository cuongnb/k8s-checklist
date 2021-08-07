docker build -f docker/echo/Dockerfile -t vda/adtech_socket .
docker save vda/adtech_socket:latest > adtech_socket.tar
scp adtech_socket.tar centos@master2:/home/centos/uploads