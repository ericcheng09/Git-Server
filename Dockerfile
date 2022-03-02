From ubuntu:20.04
ENV REPO test
ENV REPO_USER test
ENV REPO_PASS test
ENV PREFIX /git-server

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y git apache2=2.4.41-4ubuntu3.9 apache2-utils=2.4.41-4ubuntu3.9 && \
    apt-get clean
RUN mkdir -p /srv/git/repos && chown -R www-data:www-data /srv/git/repos  && a2enmod cgi alias env

WORKDIR /etc/apache2/sites-available
COPY git-site.conf .
RUN a2ensite git-site.conf && a2dissite 000-default.conf && sed -i "s/Listen 80/Listen 5000/" ../ports.conf

WORKDIR /
COPY create-git-repo.sh /creat-git-repo.sh
RUN chmod +x /creat-git-repo.sh

EXPOSE 5000
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/creat-git-repo.sh && apache2ctl -D FOREGROUND"]


