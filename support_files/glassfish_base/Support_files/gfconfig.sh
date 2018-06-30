#!/bin/bash

#first we have to start Glassfish
asadmin start-domain domain1

#Setting up password file
echo "AS_ADMIN_PASSWORD=" > /tmp/tmppasswd && \
echo "AS_ADMIN_NEWPASSWORD=$ADMIN_PASSWORD" >> /tmp/tmppasswd && \
asadmin --user admin --passwordfile=/tmp/tmppasswd change-admin-password &&\
rm /tmp/tmppasswd && \
echo "AS_ADMIN_PASSWORD=$ADMIN_PASSWORD" > $PWD_FILE

#change JVM Options
#now start setting some important jvm settings (change this as you wish)
asadmin --user admin --passwordfile=$PWD_FILE delete-jvm-options -- -client
asadmin --user admin --passwordfile=$PWD_FILE create-jvm-options -- -server
#For server deployments, -Xms and -Xmx are often set to the same value
asadmin --user admin --passwordfile=$PWD_FILE delete-jvm-options -- -Xmx512m
asadmin --user admin --passwordfile=$PWD_FILE create-jvm-options -- -Xms4096m
asadmin --user admin --passwordfile=$PWD_FILE create-jvm-options -- -Xmx4096m
#Change Metaspace size
asadmin --user admin --passwordfile=$PWD_FILE delete-jvm-options '-XX\:MaxPermSize=192m'
asadmin --user admin --passwordfile=$PWD_FILE create-jvm-options '-XX\:MaxPermSize=512m'

#disable client-initiated renegotiation (to decrease the surface for DoS attacks)
asadmin --user admin --passwordfile=$PWD_FILE create-jvm-options -Djdk.tls.rejectClientInitiatedRenegotiation=true

#get rid of http header field value "server" (Glassfish obfuscation)
asadmin --user admin --passwordfile=$PWD_FILE create-jvm-options -Dproduct.name=""

#disable sending x-powered-by in http header (Glassfish obfuscation)
asadmin --user admin --passwordfile=$PWD_FILE set server.network-config.protocols.protocol.http-listener-1.http.xpowered-by=false
asadmin --user admin --passwordfile=$PWD_FILE set server.network-config.protocols.protocol.http-listener-2.http.xpowered-by=false
asadmin --user admin --passwordfile=$PWD_FILE set server.network-config.protocols.protocol.admin-listener.http.xpowered-by=false
asadmin --user admin --passwordfile=$PWD_FILE set server.network-config.protocols.protocol.sec-admin-listener.http.xpowered-by=false

#disable SSLv3
asadmin --user admin --passwordfile=$PWD_FILE set server.network-config.protocols.protocol.http-listener-2.ssl.ssl3-enabled=false
asadmin --user admin --passwordfile=$PWD_FILE set server.network-config.protocols.protocol.sec-admin-listener.ssl.ssl3-enabled=false
asadmin --user admin --passwordfile=$PWD_FILE set server.iiop-service.iiop-listener.SSL.ssl.ssl3-enabled=false
asadmin --user admin --passwordfile=$PWD_FILE set server.iiop-service.iiop-listener.SSL_MUTUALAUTH.ssl.ssl3-enabled=false

#enable secure admin
asadmin --user admin --passwordfile=$PWD_FILE enable-secure-admin

#list current jvm options
asadmin --user admin --passwordfile=$PWD_FILE list-jvm-options

#restart to take effect
asadmin stop-domain domain1

