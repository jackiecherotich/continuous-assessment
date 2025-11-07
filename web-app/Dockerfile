# Nginx base image  to use #
FROM nginx:alpine


# working directory where Nginx serves files from)
WORKDIR /usr/share/nginx/html

#Remove the default content of nginx#
RUN rm -rf /usr/share/nginx/html/*


#Copy Static HTML file from local machine to nginx default directory#
COPY index.html /usr/share/nginx/html/

#
 EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

