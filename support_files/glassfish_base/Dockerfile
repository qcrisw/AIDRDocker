FROM cogniteev/oracle-java:java7

# Environment Variables
ENV GLASSFISH_HOME=/glassfish4 \
    PATH=$PATH:/glassfish4/bin \
    PWD_FILE=/opt/newpasswd \
    ADMIN_PASSWORD=adminadmin

# Update apt-database and install curl, maven and unzip
# Download and unzip glassfish at /
# Remove curl, unzip, glassfish zip, and apt cache contents
# Create directories for maven cache, source code and aidr data
RUN cd / && \
    apt-get update && \
    apt-get -y install curl maven unzip && \
    curl -O https://download.oracle.com/glassfish/4.1.2/release/glassfish-4.1.2.zip && \
    unzip -o glassfish-4.1.2.zip && \
    apt-get -y remove curl && \
    apt-get clean && \
    rm -f glassfish-4.1.2.zip

# Ports being exposed
EXPOSE 4848 8080 8181

# Copy glassfish configuration and startup script
COPY $PWD/Support_files/gfconfig.sh $GLASSFISH_HOME/bin/

# Copy entry point
COPY $PWD/Support_files/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["asadmin", "start-domain", "-v", "domain1"]
