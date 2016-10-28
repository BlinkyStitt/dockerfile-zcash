# Zcash

# Quick Setup with Docker

1. Install Docker from https://www.docker.com/
2. Install rocker-compose from https://github.com/grammarly/rocker-compose
3. In a terminal, run the following:

    ```bash
    git clone https://github.com/WyseNynja/dockerfile-zcash.git
    cd dockerfile-zcash
    rocker-compose run
    ```
4. Use zcash-cli without having to type a bunch of docker things:

    ```bash
    ./bin/zcash-cli help
    ```
5. Watch the logs:

    ```bash
    docker logs -f zcash.mainnet
    ```

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
