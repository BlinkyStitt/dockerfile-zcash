#
# Quick and easy zcash testnet node
#

# todo: use alpine linux to keep our images smaller
FROM bwstitt/debian:jessie

EXPOSE 8233

HEALTHCHECK --interval=5m --timeout=3s \
    CMD zcash-cli getinfo || exit 1

# install deps
RUN docker-apt-install \
    apt-transport-https \
    ca-certificates \
    wget

# install zcash from their apt source. https://github.com/zcash/zcash/wiki/Debian-binary-packages
RUN wget -qO - https://apt.z.cash/zcash.asc | apt-key add - \
 && echo "deb https://apt.z.cash/ jessie main" >/etc/apt/sources.list.d/zcash.list \
 && docker-apt-install zcash

# Use the default user that comes with the image
ENV HOME=/home/abc
ENV PATH="/home/abc/bin:${PATH}"
WORKDIR /home/abc
USER abc

# setup data volumes
RUN mkdir -p ~/.zcash ~/.zcash-params
VOLUME /home/abc/.zcash /home/abc/.zcash-params
CMD ["/start-zcashd.sh"]

COPY ./start-zcashd.sh /
