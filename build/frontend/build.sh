docker build -f Dockerfile -t vda/adtech_frontend .
docker save vda/adtech_frontend:latest > adtech_frontend.tar
scp adtech_frontend.tar centos@ads-w1:/home/centos/app