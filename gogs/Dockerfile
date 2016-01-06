FROM archlinux-rpi2

MAINTAINER nop-90

COPY assets/gogs.tar.xz /root/
RUN pacman -Sy
RUN pacman -U --noconfirm /root/gogs.tar.xz

RUN mkdir -p /home/git/.ssh
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@UsePrivilegeSeparation yes@UsePrivilegeSeparation no@' -i /etc/ssh/sshd_config
RUN sed 's@HostKey /etc/ssh/ssh_host_dsa_key@#HostKey /etc/ssh/ssh_host_dsa_key@' -i /etc/ssh/sshd_config
RUN sed 's@HostKey /etc/ssh/ssh_host_ecdsa_key@#HostKey /etc/ssh/ssh_host_ecdsa_key@' -i /etc/ssh/sshd_config
RUN sed 's@#RSAAuthentication yes@RSAAuthentication yes@' -i /etc/ssh/sshd_config
RUN sed 's@#PubkeyAuthentication yes@PubkeyAuthentication yes@' -i /etc/ssh/sshd_config

RUN  
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo "PermitUserEnvironment yes" >> /etc/ssh/sshd_config

# prepare data
ENV GOGS_CUSTOM /data/gogs
RUN echo "export GOGS_CUSTOM=/data/gogs" >> /etc/profile

ADD assets/start.sh /sbin/
RUN chmod a+x /sbin/start.sh
RUN mkdir -p /data/gogs/conf
RUN cp /srv/gogs/conf/app.ini /data/gogs/conf
EXPOSE 22
EXPOSE 3000
ENTRYPOINT ["/sbin/start.sh"]
