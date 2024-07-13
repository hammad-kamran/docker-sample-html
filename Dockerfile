# Use an official nginx image as a base
FROM nginx:latest

# Copy the HTML file to the Nginx default directory
COPY html/index.html /usr/share/nginx/html/index.html

# Expose port 81
EXPOSE 81

# Run Nginx on port 81
CMD ["nginx", "-g", "daemon off;"]
