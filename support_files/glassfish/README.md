This image is based on GlassFish Java EE Application Server 4.1.2 and Oracle JDK 1.7. It is an AIDR development server containing source code of all AIDR modules along with the required glassfish modules and maven artifacts. Tag of the image indicates the commit hash of the source code on the git repository. The dev config file "/CrisisComputing/profiles/dev/config.properties" and the deployment script "/CrisisComputing/deploy.sh" are modified to use the following environment variables for configurations.

# Environment Variables
* AIDR_HOME: Location of source code "/CrisisComputing".
* AIDR_DATA: Location for AIDR data storage "/data".
* MY_SQL_USERNAME: This variable is used in the deployment script for mysql username.
* MY_SQL_PASSWORD: This variable is used in the deployment script for mysql password.
* MY_SQL_HOST: This variable is used in the deployment script for mysql hostname.
* ADMIN_PASSWORD: Admin password for the glassfish server. Default value is "adminadmin".

