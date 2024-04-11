# Use official Ubuntu image as the base image
FROM public.ecr.aws/lts/ubuntu:latest

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory in the container
WORKDIR /app

# Install Python and other dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Copy the requirements file and install dependencies
COPY requirements.txt /app/
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY . /app/

# Expose the Flask app port
EXPOSE 80

# Command to run the application
CMD ["python3", "app.py"]
