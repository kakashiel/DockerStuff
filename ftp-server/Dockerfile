FROM centos:centos7

MAINTAINER adrien loustaunau

RUN yum -y update && yum clean all
RUN yum -y install httpd && yum clean all
RUN yum install -y vsftpd db4-utils db4

ENV PASV_ADDRESS **IPv4**
ENV PASV_MIN_PORT 21100
ENV PASV_MAX_PORT 21110

ENV FTP_USER toto
ENV FTP_PASS toto*
#log_stdout: true or false (false by default)
ENV LOG_STDOUT true


COPY vsftpd.conf /etc/vsftpd/
COPY vsftpd_virtual /etc/pam.d/
COPY docker-entrypoint.sh /usr/sbin/

RUN chmod +x /usr/sbin/docker-entrypoint.sh
RUN mkdir -p /home/vsftpd/
RUN chown -R ftp:ftp /home/vsftpd/


EXPOSE 20 21

#Restart pour le fichier de conf
CMD ["/usr/sbin/docker-entrypoint.sh"]
