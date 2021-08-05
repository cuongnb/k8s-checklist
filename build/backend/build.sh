docker build -f Dockerfile -t vda/adtech_backend .
docker save vda/adtech_backend:latest > adtech_backend.tar
scp adtech_backend.tar centos@master2:/home/centos/uploads