#!/bin/sh
curl https://raw.githubusercontent.com/rizinorg/rizin/dev/Dockerfile -o Containerfile.rizin
buildah bud -f Contaierfile.rizin -t avride/rizin
buildah bud -f Containerfile.devbackend -t avride/devbackend
buildah bud -f Containerfile.simavr -t avride/simavr
