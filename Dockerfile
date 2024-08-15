# Use a base image that supports Java 17
FROM tomcat:10.1.8-jdk17-temurin

# Remove unnecessary default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file into the Tomcat webapps directory
COPY ./target/new-demo-app* /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Create a non-root user
RUN groupadd -r appgroup && useradd -r -g appgroup demo-application

# Set the user
USER demo-application

# Set the working directory
WORKDIR /usr/local/tomcat

# Start Tomcat
CMD ["catalina.sh", "run"]
