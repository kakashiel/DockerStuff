FROM couchdb:latest

MAINTAINER adrien Loustaunau

#CouchDB configuration file
COPY local.ini /usr/local/etc/couchdb/

#Specifie l'utilistatuer de couchdb et son password
ENV COUCHDB_USER     admin
ENV COUCHDB_PASSWORD admin*

# exposition du port 5984 couchDB
EXPOSE 5984

VOLUME ["/usr/local/var/lib/couchdb"]
