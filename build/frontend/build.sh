docker build -f Dockerfile -t vda/adtech_frontend .
docker save vda/adtech_frontend:latest > adtech_frontend.tar
scp adtech_frontend.tar centos@master2:/home/centos/uploads