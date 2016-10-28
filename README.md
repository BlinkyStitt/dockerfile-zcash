# Zcash

Run https://z.cash/ with just a couple commands

Also on https://hub.docker.com/r/bwstitt/zcash

# Quick Setup with Docker

1. Install Docker from https://www.docker.com/
2. Install rocker-compose from https://github.com/grammarly/rocker-compose
3. In a terminal, run the following:

    ```bash
    git clone https://github.com/WyseNynja/dockerfile-zcash.git
    cd dockerfile-zcash
    ```

4. Edit the mainnet.conf with a more secure password and maybe enable mining.
5. In a terminal, run the following to start zcash:

    ```bash
    rocker-compose pull
    rocker-compose run
    ```
6. Watch the logs:

    ```bash
    docker logs -f zcash.mainnet
    ```
7. Once the params have finished downloading and the daemon has started, using zcash-cli is easy:

    ```bash
    ./bin/zcash-cli help
    ./bin/zcash-cli getinfo
    ./bin/zcash-cli getpeerinfo
    ```
8. Back up your wallet!

    ```bash
    cp ./data/mainnet/wallet.dat /backups/somewhere/safe
    ```


IMPORTANT! The wallet encryption feature is disabled in zcashd so be careful!


# Doing more

Run commands against the container:
```bash
docker exec -it zcash.mainnet bash -l

docker exec -it zcash.mainnet free -h
docker exec -it zcash.mainnet nproc

docker exec -it zcash.mainnet zcash-cli help
docker exec -it zcash.mainnet zcash-cli getinfo
docker exec -it zcash.mainnet zcash-cli zcbenchmark solveequihash 10
docker exec -it zcash.mainnet zcash-cli zcbenchmark solveequihash 20
docker exec -it zcash.mainnet zcash-cli setgenerate true 1
```


# Developing

## Build the image

```bash
docker build . -t bwstitt/zcash
```


# Todo

 * [ ] helper to customize config
 * [ ] expose ports
 * [ ] easily switch between mainnet and testnet and regtest
 * [ ] use rocker-compose inside a container so that it doesn't need to be installed on the host
