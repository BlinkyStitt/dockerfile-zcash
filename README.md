# Zcash

Run https://z.cash/ with just a couple commands

Also on https://hub.docker.com/r/bwstitt/zcash

# Quick Setup with Docker

1. Open port 8233 on your router
2. Install Docker from https://www.docker.com/
3. Install rocker-compose from https://github.com/grammarly/rocker-compose
4. In a terminal, run the following:

    ```bash
    git clone https://github.com/WyseNynja/dockerfile-zcash.git
    cd dockerfile-zcash
    ```

5. Edit the mainnet.conf with a more secure password and maybe enable mining.
6. In a terminal, run the following to start zcash:

    ```bash
    rocker-compose pull
    rocker-compose run
    ```
7. Watch the logs:

    ```bash
    docker logs -f zcash.mainnet
    ```
8. Once the params have finished downloading and the daemon has started, using zcash-cli is easy:

    ```bash
    ./bin/zcash-cli help
    ./bin/zcash-cli getinfo
    ./bin/zcash-cli getpeerinfo
    ```
9. Back up your wallet!

    ```bash
    cp ./data/mainnet/wallet.dat /backups/somewhere/safe
    ```
10. Start mining:

    ```bash
    # to mine on all cores (this will make your computer hot)
    ./bin/zcash-cli setgenerate true -1

    # to mine on 1 cores (this will make your computer not as hot)
    ./bin/zcash-cli setgenerate true 1
    ```
10. Stop mining

    ```bash
    ./bin/zcash-cli setgenerate false
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
 * [ ] use Tor


# Authors

Donations are much appreciated!

 - Bryan Stitt 
     - BTC 17vi3UfTYNRi6RnWRbhv7nXBH66c4gVYEV
     - ZEC address coming once I setup a permanent node
