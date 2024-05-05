# Use the official Python image as the base image
FROM python:3.9-slim

# Install curl and tar
RUN apt-get update && apt-get install -y curl tar

# Download and extract Tile38
RUN curl -L https://github.com/tidwall/tile38/releases/download/1.32.2/tile38-1.32.2-linux-amd64.tar.gz -o tile38-1.32.2-linux-amd64.tar.gz \
    && tar xzvf tile38-1.32.2-linux-amd64.tar.gz \
    && cd tile38-1.32.2-linux-amd64

# Set the working directory to the extracted Tile38 directory
WORKDIR /tile38-1.32.2-linux-amd64

# Expose the default Tile38 port
EXPOSE 9851

# Run the Tile38 server
CMD ["./tile38-server"]
