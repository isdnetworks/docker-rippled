FROM isdnetworks/centos:8-ko
LABEL maintainer="is:-D Networks Docker Maintainers <jhcheong@isdnetworks.pe.kr>"

COPY rippled-1.6.0-1.el7.x86_64.rpm /root
WORKDIR /root
RUN chown -R 0:0 rippled-1.6.0-1.el7.x86_64.rpm \
 && rpm -ivh rippled-1.6.0-1.el7.x86_64.rpm \
 && rm rippled-1.6.0-1.el7.x86_64.rpm

WORKDIR /home/rippled
USER rippled

VOLUME ["/var/lib/rippled", "/var/log/rippled"]

EXPOSE 51235/tcp 51235/udp 5005/tcp 6006/tcp

CMD ["/opt/ripple/bin/rippled", "--net", "--conf", "/etc/opt/ripple/rippled.cfg"]

