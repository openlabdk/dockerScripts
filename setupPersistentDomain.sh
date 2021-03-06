#!/bin/bash

#set -x

vDomain=$1
container=$2

showSyntax() {
	echo "Thy-IT Setup Simple Container Script"
	echo "------------------------------------"
	echo "Syntax: $0 <Domain> <Container>     "
	echo ""
}

if [ -z "$vDomain" ]
then
	showSyntax
else
	docker volume create $vDomain-data
	docker run -ti --name $vDomain-SimpleHost --volume=$vDomain-data -e VIRTUAL_HOST=$vDomain -d $container
fi

