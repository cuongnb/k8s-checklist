FROM node:13-alpine

WORKDIR /app

COPY echo.json /app/echo.json
COPY laravel-echo-server.json.prod /app/laravel-echo-server.json

RUN npm install -g pm2 laravel-echo-server
#RUN npm install -g pm2 haupp246/laravel-echo-server
#
RUN mkdir -p /usr/local/lib/node_modules/laravel-echo-server
COPY laravel-echo-server/ /usr/local/lib/node_modules/laravel-echo-server/

EXPOSE 6001

CMD ["pm2-runtime", "echo.json"]
