# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app
# Install system dependencies (if any)
RUN apt-get update && apt-get install -y git

# Install dependencies specified in requirements.txt (if any)
# COPY requirements.txt /app/
# RUN pip install --no-cache-dir -r requirements.txt

# Install jaseci
RUN pip install git+https://github.com/Jaseci-Labs/jaclang-jaseci.git@jaseci/v1.0.2

# If the repository has submodules, you can use the --recurse-submodules flag
# RUN pip install git+https://github.com/username/repository.git@branch#egg=packagename&subdirectory=submodule_dir


# Copy the current directory contents into the container at /app
COPY . /app


# Make port 5000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["jac", "run", "/app/main.jac"]