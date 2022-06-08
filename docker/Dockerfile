FROM alpine:3.16.0

ARG USER=ory
ENV HOME /home/$USER
ENV JQ_VERSION 1.6

RUN apk add --no-cache --update-cache --upgrade --latest \
	ca-certificates curl netcat-openbsd coreutils bash inotify-tools procps

RUN curl -Lo /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-$JQ_VERSION/jq-linux64 &&\
	chmod +x /usr/local/bin/jq &&\
	jq --version

RUN addgroup -S $USER &&\
    adduser -S $USER -G $USER -D -H -s /bin/bash

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" &&\
	chmod +x kubectl &&\
	mv kubectl /usr/local/bin/kubectl

USER $USER
WORKDIR $HOME

ENTRYPOINT ["/bin/bash"]
