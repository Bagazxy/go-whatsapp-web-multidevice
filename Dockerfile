# Use an official Docker image as a base
FROM docker:latest

# Install Docker Compose
RUN apk add --no-cache py3-pip \
    && pip install docker-compose

# Set the working directory inside the container
WORKDIR /app

# Copy the docker-compose.yml file into the container
COPY docker-compose.yml .

# Expose port 3000 (or any other ports your services need)
EXPOSE 3000

# Start Docker Compose
CMD ["docker-compose", "up"]
