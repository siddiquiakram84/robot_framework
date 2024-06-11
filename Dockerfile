# Use an official Python runtime as a parent image
FROM python:latest

# Install necessary packages and dependencies
RUN apt-get update -yqq && apt-get install -yqq \
    apt-transport-https \
    libnss3 \
    zip \
    ffmpeg \
    wget \
    unzip \
    sudo

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Additional Python dependencies for API testing
RUN pip install robotframework robotframework-requests

# Install Flask for running the dummy API
RUN pip install Flask

# Create a headless user for running tests
RUN useradd headless --shell /bin/bash --create-home \
  && usermod -a -G sudo headless \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'headless:nopassword' | chpasswd

# Create necessary directories and set the appropriate permissions
RUN mkdir -p /app/logs /app/results /app/reports \
  && chown -R headless:headless /app/logs /app/results /app/reports

# Switch to the headless user
USER headless

# Expose port for the Flask API
EXPOSE 5000

# Set entrypoint to start the Flask API and execute tests
ENTRYPOINT ["bash", "entrypoint.sh"]
