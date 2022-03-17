FROM alpine:3.15.0

ARG USER=ory
ENV HOME /home/$USER

RUN apk add --no-cache --update-cache --upgrade --latest \
	ca-certificates curl netcat-openbsd coreutils bash inotify-tools procps

RUN addgroup -S $USER &&\
    adduser -S $USER -G $USER -D -H -s /bin/bash

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" &&\
	chmod +x kubectl &&\
	mv kubectl /usr/local/bin/kubectl

USER $USER
WORKDIR $HOME

ENTRYPOINT ["/bin/bash"]
