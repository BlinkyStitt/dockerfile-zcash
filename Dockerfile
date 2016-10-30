#
# Quick and easy zcash testnet node
#

# todo: use alpine linux to keep our images smaller
FROM bwstitt/library-debian:jessie

# create user
RUN useradd -ms /bin/bash zcash
ENV HOME=/home/zcash
ENV PATH="/home/zcash/bin:${PATH}"
WORKDIR /home/zcash

# install deps
RUN docker-apt-install \
    apt-transport-https \
    ca-certificates \
    wget

# install zcash from their apt source. https://github.com/zcash/zcash/wiki/Debian-binary-packages
RUN wget -qO - https://apt.z.cash/zcash.asc | apt-key add - \
 && echo "deb https://apt.z.cash/ jessie main" >/etc/apt/sources.list.d/zcash.list \
 && docker-apt-install zcash

# setup data volumes
RUN mkdir -p ~/.zcash ~/.zcash-params
VOLUME /home/zcash/.zcash /home/zcash/.zcash-params

ADD ./start-zcashd.sh /start-zcashd.sh
USER zcash
CMD ["sh", "/start-zcashd.sh"]

HEALTHCHECK --interval=5m --timeout=3s \
    CMD zcash-cli getinfo || exit 1

EXPOSE 8233
