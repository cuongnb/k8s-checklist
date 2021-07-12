docker build -f Dockerfile -t vda/adtech_backend .
docker save vda/adtech_backend:latest > adtech_backend.tar
scp adtech_backend.tar centos@ads-w1:/home/centos/app