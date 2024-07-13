# Docker Sample HTML

This repository contains a Docker setup to host a sample HTML page with group information. It includes instructions to route a domain name to the container and add an SSL certificate.

## Steps

1. Setup Docker container with a sample HTML page.
2. Map Docker internal port 81 to an external port.
3. Route your domain name to the mapped port.
4. Add an SSL certificate.

## Prerequisites

- Docker installed on your machine.
- A domain name that you can configure.
- Basic knowledge of terminal/command line.

---

### Step 1: Setup Docker Container

1. **Clone the Repository:**

    ```sh
    git clone https://github.com/YOUR_USERNAME/docker-sample-html.git
    cd docker-sample-html
    ```

2. **Create a Dockerfile:**

    ```Dockerfile
    # Use an official nginx image as a base
    FROM nginx:latest

    # Copy the HTML file to the Nginx default directory
    COPY html/index.html /usr/share/nginx/html/index.html

    # Expose port 81
    EXPOSE 81

    # Run Nginx on port 81
    CMD ["nginx", "-g", "daemon off;"]
    ```

3. **Create a Sample HTML Page:**

    ```html
    <!DOCTYPE html>
    <html>
    <head>
        <title>Group Info</title>
    </head>
    <body>
        <h1>Welcome to Our Group Page</h1>
        <p>Group Members: Hammad, Zaman, Muqadas, Shahreyer</p>
    </body>
    </html>
    ```

4. **Build and Run the Docker Container:**

    ```sh
    docker build -t sample-html .
    docker run -d -p 8080:81 sample-html
    ```

    Replace `8080` with any port you prefer to use.

---

### Step 2: Route Domain Name

1. **Configure Your Domain Name:**
   
    - Log in to your domain registrar.
    - Create an A Record pointing to your server's IP address.
    - Create a CNAME record pointing your subdomain to your domain.

2. **Verify Domain Routing:**
   
    Open your browser and navigate to your domain. You should see the sample HTML page.

---

### Step 3: Add SSL Certificate

1. **Install Certbot:**

    On Ubuntu:
    ```sh
    sudo apt-get update
    sudo apt-get install certbot python3-certbot-nginx
    ```

2. **Obtain SSL Certificate:**

    ```sh
    sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
    ```

3. **Follow the Prompts to Complete the SSL Installation:**

    Certbot will automatically configure Nginx to use the SSL certificate.

4. **Verify SSL Setup:**

    Open your browser and navigate to `https://yourdomain.com`. You should see the secure version of your site.

---

### Conclusion

You have successfully set up a Docker container to host a sample HTML page, routed your domain to the container, and secured it with an SSL certificate.

If you encounter any issues, please refer to the respective documentation or seek assistance from online communities.
