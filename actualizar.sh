#!/bin/sh


# ORIGENES SOPORTADOS
# Se admiten solamente repositorios de Rhodecode 
# (en lugar de la IP se podrían usar los nombres de los repositorios o un patrón que combine ambos)
declare -a SUPPORTED_ORIGINS=("10.1.140.41")


# RUTA DE INSTALACIÓN
INSTALL_DIR_ROOT="$HOME/.baustro"


is_supported_origin() {
	ORIGIN=$(git config --get remote.origin.url)
	for supported in "${SUPPORTED_ORIGINS[@]}"
	do
		if [[ $ORIGIN == *"$supported"* ]]
		then
			return 0 #true in bash
		fi
	done
	return 1 #false in bash
}


do_update() {
	sh "instalar.sh"
}


execute() {
	if is_supported_origin
	then
		do_update
	fi
}


# FUNCION PRINCIPAL
execute