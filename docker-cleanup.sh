#!/bin/sh

echo
echo " --> Nettoyage du noeud Docker"
echo

echo " ----> Suppression conteneurs arrêtés"
docker ps -a      --filter=status=exited --quiet | xargs  docker rm

echo " ----> Suppression images abandonnées"
docker images     --filter=dangling=true --quiet | xargs  docker rmi

echo " ----> Suppression volumes orphelins"
docker volume ls  --filter=dangling=true --quiet | xargs  docker volume rm

echo
echo " --> Fin du nettoyage"
echo
