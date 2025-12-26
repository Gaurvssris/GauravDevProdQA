# stage-1 
FROM node:16.20-bullseye AS roni
WORKDIR /app/
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/devopsinsiders/MicroTodoUI.git .
RUN npm install
RUN npm run build 

#stage-2
FROM nginx:stable-alpine-slim
RUN rm -rf /usr/share/nginx/html/*
COPY --from=roni /app/build/ usr/share/nginx/html/
CMD [ "nginx", "-g", "daemon off;"  ]