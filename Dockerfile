# Use the prebuilt Docker image from Docker Hub as the base image
FROM aldinokemal2104/go-whatsapp-web-multidevice:latest

# Set the working directory inside the container
WORKDIR /app

# Expose the application port
EXPOSE 3000

# Command to run the application with the specified arguments
CMD ["--basic-auth=admin:admin", "--port=3000", "--debug=true", "--os=Chrome", "--account-validation=false"]
