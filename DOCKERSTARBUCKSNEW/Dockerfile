FROM nginx  
WORKDIR /app
COPY  . . 
RUN rm -rf /usr/share/nginx/html
RUN cp -r /app/starbucks-clone/ /usr/share/nginx/html