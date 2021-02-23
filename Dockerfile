FROM ubuntu:latest

VOLUME /etc/perdition

# Install Perdition from repository
RUN apt-get update && \
    apt-get -o Dpkg::Options::="--force-confold" upgrade -q -y --force-yes && \
    apt-get install -y --no-install-recommends gettext-base rsyslog perdition perdition-ldap ca-certificates vim net-tools && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#copy default configuration
COPY perdition/default-perdition /etc/default/perdition

#Expose ports for services
EXPOSE 110/tcp 143/tcp 993/tcp 995/tcp

WORKDIR /etc/perdition

COPY main.sh /
RUN chmod +x /main.sh

ENTRYPOINT ["/main.sh"]
CMD ["DEFAULT"]