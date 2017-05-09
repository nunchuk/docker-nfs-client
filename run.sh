#!/bin/sh
set -e

if [ -n ${SERVER} ] && [ -n ${VERSION} ] && [ -n ${DESTINATION} ]; then
	(
		mkdir -p "${DESTINATION}"
		if [ -n ${SOURCE} ]; then
			SOURCE="/"
		fi
		set -x
		case "${VERSION}" in
			NFSv3)
				mount -t nfs -o vers=3,nolock,proto=tcp ${SERVER}:${SOURCE} ${DESTINATION}
			;;
			NFSv4)
				mount -t nfs4 ${SERVER}:${SOURCE} ${DESTINATION}
			;;
		esac
	)
fi
set -x
mount | grep nfs
tail -f /dev/null