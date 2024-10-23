FROM alpine:3.20

ARG USER=ory
ENV HOME /home/$USER
ENV JQ_VERSION 1.7.1
ENV KUBECTL_VERSION 1.31.2

RUN apk add --no-cache --update-cache --upgrade --latest \
	ca-certificates curl netcat-openbsd coreutils bash inotify-tools procps

RUN curl -Lo /usr/local/bin/jq "https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64" &&\
	chmod +x /usr/local/bin/jq &&\
	jq --version

RUN addgroup -S $USER &&\
    adduser -S $USER -G $USER -D -H -s /bin/bash

RUN curl -LO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" &&\
	chmod +x kubectl &&\
	mv kubectl /usr/local/bin/kubectl

USER $USER
WORKDIR $HOME

ENTRYPOINT ["/bin/bash"]
