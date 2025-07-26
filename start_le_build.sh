#!/bin/bash
. ./variables.sh "$@"

IMAGE=le-build

echo "on ${BASETAG}"
docker run -it --rm \
    --name le-build-${BASETAG} \
    --env TZ=${CONTTZ} \
    --env LC_ALL=${CONTLCALL} \
    --user ${UNAME} \
    --workdir /home/${UNAME} \
    --hostname libreelec-build \
    --volume ${LEREPO}:/home/${UNAME}/libreelec \
    --volume ${SSHKEYS}:/home/${UNAME}/.ssh \
    --volume ${PERSISTENT_CD}/${IMAGE}/scripts:/home/${UNAME}/scripts \
    ${UNAME}/${IMAGE}:${BASETAG} /bin/bash
