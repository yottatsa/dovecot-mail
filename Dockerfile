FROM alpine:latest
RUN apk add --no-cache dovecot
RUN sed -i '/postfix\/private\/auth/,+2 s,#,,; s,unix_listener lmtp,unix_listener /var/spool/postfix/private/dovecot-lmtp,; /service lmtp/,+2 s,#,,;' /etc/dovecot/conf.d/10-master.conf
RUN sed -i '/^auth_mechanisms/ s,=.*,= cram-md5,' /etc/dovecot/conf.d/10-auth.conf
RUN sed -i '/lmtp_save_to_detail_mailbox/ s,^#,,; /lmtp_save_to_detail_mailbox/ s,\bno\b,yes,; /protocol lmtp/ a\ \ auth_username_format = %n' /etc/dovecot/conf.d/20-lmtp.conf
CMD exec dovecot -c /etc/dovecot/dovecot.conf -F
