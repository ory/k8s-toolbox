FROM alpine:3.14.0

ARG USER=ory
ENV HOME /home/$USER

RUN apk add -U --no-cache \
	ca-certificates sudo curl netcat-openbsd coreutils bash inotify-tools

RUN addgroup -S $USER &&\
    adduser -S $USER -G $USER -D -H -s /bin/bash &&\
    echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER &&\
    chmod 0440 /etc/sudoers.d/$USER

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" &&\
	chmod +x kubectl &&\
	mv kubectl /usr/local/bin/kubectl

USER $USER
WORKDIR $HOME

ENTRYPOINT ["/bin/bash"]
