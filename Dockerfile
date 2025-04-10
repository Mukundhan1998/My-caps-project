FROM nginx:alpine
<<<<<<< HEAD
COPY build /usr/share/nginx/html
=======
COPY . /usr/share/nginx/html
>>>>>>> 4db4230b482ffcaacf02fcbb7bf3ed212e762956
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]