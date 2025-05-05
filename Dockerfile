# Use an official Go image as the base image
FROM golang:1.20-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Install necessary tools and dependencies
RUN apk add --no-cache git ffmpeg

# Copy go.mod and go.sum to download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Build the application binary
RUN go build -o whatsapp ./src/main.go

# Use a minimal image for running the application
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Install ffmpeg for media processing
RUN apk add --no-cache ffmpeg

# Copy the compiled binary and other necessary files
COPY --from=builder /app/whatsapp /app/whatsapp
COPY --from=builder /app/views /app/views
COPY --from=builder /app/statics /app/statics

# Expose the application's port
EXPOSE 3000

# Command to run the application
CMD ["./whatsapp"]
