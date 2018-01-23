#!/bin/sh

#
# Script permettant de lancer un conteneur docker Base de données
#

# -----------------------------------------------------
# Fonctions
# -----------------------------------------------------

#######################################
# Affiche l'usage du script d'install
# Arguments:
#   None
# Returns:
#   None
#######################################
usage()
{
  echo -e "usage: $0 <DB_PORT> <DB_NAME>"
  echo -e "\narguments:"
  echo -e "  <DB_PORT>   Port d'écoute couchDB"
  echo -e "  <DB_NAME>   Nom de la database "
}

# -----------------------------------------------------
# Vérifications de lancement
# -----------------------------------------------------

# vérification que les arguments env et version sont bien renseignés
if [[ $# -ne 2 ]]; then
  usage && exit 1
fi

# association des variables
db_port=$1
database=$2


echo
echo " --> Lancement d'un conteneur Base de données"
echo
echo "     Port     = $db_port"
echo "     Database = $database"
echo

# force la récupération de la dernière image du registry
docker pull slnxdeltattools01.ntes.fr.sopra:5000/couchdb

# stoppe les éventuels conteneurs déjà lancés
docker stop couchdb-$db_port && docker rm -v couchdb-$db_port

docker run -d \
  --name=couchdb-$db_port \
  -p $db_port:5984 slnxdeltattools01.ntes.fr.sopra:5000/couchdb $repo

sleep 15

if [[ -n $database ]]; then
  curl -u admin:trtcouchdb* -X PUT http://$HOSTNAME.ntes.fr.sopra:$db_port/$database-$db_port
fi
