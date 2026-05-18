FROM alpine:3.23.4@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11

ARG USER=ory
ARG BUILD_ARCH=amd64
ENV HOME=/home/$USER
# renovate: datasource=github-releases depName=jq packageName=jqlang/jq
ENV JQ_VERSION=1.8.1
# renovate: datasource=github-releases depName=kubernetes packageName=kubernetes/kubernetes
ENV KUBECTL_VERSION=1.36.1

RUN apk add --no-cache --update-cache --upgrade \
	ca-certificates curl netcat-openbsd coreutils bash inotify-tools procps

RUN curl -Lo /usr/local/bin/jq "https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux-${BUILD_ARCH}" &&\
	chmod +x /usr/local/bin/jq &&\
	jq --version

RUN addgroup -S $USER &&\
    adduser -S $USER -G $USER -D -H -s /bin/bash

RUN curl -LO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/${BUILD_ARCH}/kubectl" &&\
	chmod +x kubectl &&\
	mv kubectl /usr/local/bin/kubectl

USER $USER
WORKDIR $HOME

ENTRYPOINT ["/bin/bash"]
