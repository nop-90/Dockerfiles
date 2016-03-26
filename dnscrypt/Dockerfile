FROM l3iggs/archlinux

MAINTAINER nop-90

RUN pacman -Syy --noconfirm
RUN pacman -S dnscrypt-proxy bind --noconfirm

RUN rm /etc/named.conf

COPY assets/named.conf /etc/
ENV resolver_name="dnscrypt.eu-dk"

COPY assets/entrypoint.sh /sbin/
RUN chmod +x /sbin/entrypoint.sh

EXPOSE 53/udp

ENTRYPOINT ["/sbin/entrypoint.sh"]
