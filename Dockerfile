FROM alpine:latest
RUN apk add --no-cache dovecot
CMD exec dovecot -c /etc/dovecot/dovecot.conf -F
