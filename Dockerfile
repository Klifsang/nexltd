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

# Copy the vercel.json file to the working directory
COPY vercel.json /vercel.json

# Start the Tile38 server and the application
CMD ["./tile38-server"] # Start Tile38 server
# Set environment variables
ENV FLASK_ENV=production
ENV FLASK_APP=index.py

# Set the working directory
WORKDIR /app

# Copy the application files
COPY index.py /app/index.py
COPY client /app

# Install Flask
RUN pip install Flask

# Expose the Flask port
EXPOSE 5000

# Command to run the Flask application
CMD ["flask", "run", "--host", "0.0.0.0"]
