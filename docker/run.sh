# /bin/bash

sudo docker run \
    -v $1:/build \
    -v $2:/assets \
    -v $3:/strings \
    -e LANG=$4 \
    -e VERSION=$5 \
    ghcr.io/haroohie-club/chokuretsu-devkitarm:main \
    pwsh /build/docker/docker-run.ps1