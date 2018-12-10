#This is a Dockerfile for a microservice application 
 
# Use an official Java 8 runtime as a parent image 
FROM maven:3.6-jdk-8-alpine 
 
VOLUME /tmp 
 
#Set maintainer email id 
MAINTAINER liodegar@gmail.com  
 
# Set the working directory to /app 
WORKDIR /app 
 
# Copy the current directory contents into the container at /app 
ADD . /app 

# Install any needed packages libraries
RUN mvn clean install

# Build and create jar using maven command
RUN mvn package
 
# Copy the current directory contents into the container at /app 
ADD target/categories-restapp-0.0.1-SNAPSHOT.jar categories-restapp.jar
 
# Make port 8080 available to the world outside this container
EXPOSE 8080
 
# Define environment variable 
ENV JAVA_OPTS="" 
 
# Run accounts-microservice.jar when the container launches 
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar categories-restapp.jar" ]