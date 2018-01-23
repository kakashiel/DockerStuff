#!/bin/sh

#
# Script permettant de construire les images docker
#

# plante le script dès le premier retour en erreur
set -e

#Envoi l'image sur le compte docker de l'utilisateur
export DOCKER_ID_USER="kakashiel"


echo " --> Construction des images Docker ..."

echo " ----> Construction de l'image ftp-server"

docker build -t ftp-server ftp-server \
  && docker tag ftp-server $DOCKER_ID_USER/ftp \
  && docker push $DOCKER_ID_USER/ftp


echo " ----> Construction de l'image couchDB"

docker build -t couchdb-server couchdb \
  && docker tag couchdb-server $DOCKER_ID_USER/couchdb \
  && docker push $DOCKER_ID_USER/couchdb

echo " --> Images Docker construites avec succès"
