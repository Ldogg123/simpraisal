FROM golang:1.22.6-alpine
LABEL maintainer="Ldogg123 <https://github.com/Ldogg123/simpraisal>"
WORKDIR $GOPATH/src/github.com/Ldogg123/simpraisal
RUN apk --update add --no-cache --virtual build-dependencies git gcc musl-dev make bash && \
    git clone https://github.com/Ldogg123/simpraisal.git . && \
    export GO111MODULE=on ENV=prod && \
    make setup && \
    make build && \
    make install && \
    mkdir /evepraisal/ && \
    mv $GOPATH/bin/evepraisal /evepraisal/evepraisal && \
    rm -rf $GOPATH && \
    apk del build-dependencies && \
    mkdir /evepraisal/db
WORKDIR /evepraisal/
CMD ["./evepraisal"]
