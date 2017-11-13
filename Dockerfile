FROM alpine:latest
RUN apk add --no-cache dovecot
RUN sed -i '/postfix\/private\/auth/,+2 s,#,,'  /etc/dovecot/conf.d/10-master.conf
RUN sed -i '/^auth_mechanisms/ s,=.*,= cram-md5,' /etc/dovecot/conf.d/10-auth.conf
CMD exec dovecot -c /etc/dovecot/dovecot.conf -F
