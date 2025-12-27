# stage-1 
FROM node AS build1
WORKDIR /app/
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/devopsinsiders/MicroTodoUI.git .
RUN npm install
RUN npm run build 

#stage-2
FROM nginx:stable-alpine-slim
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build1 /app/build/ usr/share/nginx/html/
CMD [ "nginx", "-g", "daemon off;"  ]