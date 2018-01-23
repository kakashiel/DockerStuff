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
  echo -e "usage: $0 <FTP_PORT>"
  echo -e "\narguments:"
  echo -e "  <FTP_PORT>   Port ftp"
}

# -----------------------------------------------------
# Vérifications de lancement
# -----------------------------------------------------

# vérification que les arguments env et version sont bien renseignés
if [[ $# -ne 1 ]]; then
  usage && exit 1
fi

# association des variables
ftp_port=$1


echo
echo " --> Lancement d'un conteneur serveur ftp"
echo
echo "     Port  = $ftp_port"
echo

# force la récupération de la dernière image du registry
docker pull $DOCKER_ID_USER/ftp

# stoppe les éventuels conteneurs déjà lancés
docker stop ftp-$ftp_port && docker rm -v ftp-$ftp_port

docker run -d \
  --name=ftp-$ftp_port\
  -p $ftp_port:$ftp_port $DOCKER_ID_USER/ftp
