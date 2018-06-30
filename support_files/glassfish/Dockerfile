FROM aidr/glassfish:base

# Environment Variables
ENV AIDR_HOME=/CrisisComputing \
    AIDR_DATA=/data

# Change working direcotry to source folder, this will also create directory
WORKDIR $AIDR_HOME

# Create directories for aidr data
RUN mkdir $AIDR_DATA/persister \
    mkdir $AIDR_DATA/aidr_model

# Copy glassfish module files
COPY $PWD/jars/*.jar $GLASSFISH_HOME/glassfish/modules/

# Copy maven repository files
COPY $PWD/repository /root/.m2/repository

# Clone aidr-dev repository
COPY $PWD/CrisisComputing.zip /

# Unzip repo, clean repo zip, install maven artifacts
RUN cd / && \
    unzip -o CrisisComputing.zip && \
    rm CrisisComputing.zip && \
    cd $AIDR_HOME && \
    mvn -P dev install

