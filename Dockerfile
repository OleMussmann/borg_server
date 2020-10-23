FROM alpine:3.12

RUN apk add --no-cache \
      borgbackup \
      openssh \
      sshfs \
      supervisor

COPY supervisord.conf /etc/supervisord.conf
COPY service.sh /usr/local/bin/service.sh

RUN passwd -d root

RUN adduser -D backup && passwd -u backup
#COPY ./userfiles/authorized_keys /home/backup/.ssh/authorized_keys

CMD ["/usr/bin/supervisord"]
