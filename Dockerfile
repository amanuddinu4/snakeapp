# Use the official Nginx base image
FROM nginx:alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy all game files to the Nginx web server's root directory
COPY index.html style.css script.js ./

# Expose port 80 to make the application accessible
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
