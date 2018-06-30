# Admin Username
The default admin username is "admin". Use --user admin with asadmin to specify the admin username.

# Default Glassfish Domain
The default glassfish domain used is "domain1".

# Environment Variables
* GLASSFISH_HOME: Base directory for glassfish installation (Default value "/glassfish4").
* PATH: /glassfish4/bin is added to the path, therefore, asadmin is available without specifying the complete path.
* PWD_FILE: Password file used for the glassfish (Default value "/opt/newpasswd"). Use this variable in the deployment script for admin user password using --passwordfile=$PWD_FILE.
* ADMIN_PASSWORD: Password used for the glassfish admin user (Default value "adminadmin"). Set this environment variable to change the admin password.

# Installed Packages
* Maven
* Unzip

# Exposed Ports
* 4848 (For admin console)
* 8080 (For http web server)
* 8181 (For https web server)

# Glassfish Configurations
The entry point is modified to trap SIGTERM for graceful shutdown of the glassfish server. Moreover, the following configurations are applied:
* Admin password is changed to ADMIN_PASSWORD environment variable
* The password file PWD_FILE is updated with the ADMIN_PASSWORD environment variable
* Following JVM options are updated:
  * Glassfish mode is set to server
  * Heap memory is set to 4GB
  * MaxPermSize is set to 512MB
  * Client-initiated renegotiation is disabled
  * Sending x-powered-by in http header is disabled
  * SSLv3 is disabled
  * Secure admin is enabled

# Persisting the Deployments
The deployments can be persisted by mounting a volume at the path /glassfish4/glassfish/domains.
