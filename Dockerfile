FROM alpine:3.10

MAINTAINER Pawel Urawski

####################################################
########               Update               ########
####################################################

 
RUN set -x \
    apk update && \
    apk --no-cache --no-progress upgrade \
    && apk add --no-cache \
        bash-completion \
        samba \
    && rm -rf /var/cache/apk/*   

RUN rm -rf /var/cache/apk/* && \
    rm /etc/samba/smb.conf

VOLUME ["/etc/samba","/var/lib/samba"]

EXPOSE 137/udp 138/udp 139 445
COPY sleepi.sh /
COPY init.sh /
#CMD ["/bin/sh"]
CMD ["/init.sh"]