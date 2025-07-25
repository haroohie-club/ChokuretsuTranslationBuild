# /bin/bash

docker run --rm \
    -v $1:/build:Z \
    -v $2:/assets:Z \
    -v $3:/strings:Z \
    -e LANG=$4 \
    -e ROM_VERSION=$5 \
    ghcr.io/haroohie-club/chokuretsu-devkitarm:main \
    pwsh /build/docker/docker-run.ps1
