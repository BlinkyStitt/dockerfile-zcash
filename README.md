# Zcash

# Quick Setup with Docker

1. Install Docker from https://www.docker.com/
2. Install rocker-compose from https://github.com/grammarly/rocker-compose
3. In a terminal, run the following:

```bash
rocker-compose run
docker exec -it zcash.node zcash-cli getinfo
```

# Doing more

Run commands against that container:
```bash
docker exec -it zcash.testnet bash -l
docker exec -it zcash.testnet free -h
docker exec -it zcash.testnet nproc
docker exec -it zcash.testnet zcash-cli help
docker exec -it zcash.testnet zcash-cli getinfo
docker exec -it zcash.testnet zcash-cli zcbenchmark solveequihash 10
docker exec -it zcash.testnet zcash-cli zcbenchmark solveequihash 20
docker exec -it zcash.testnet zcash-cli setgenerate true 1
```

Tail logs:
```bash
docker logs zcash.testnet -f
```


# Developing

## Build the image

```bash
docker build . -t bwstitt/zcash
```


# Todo

 * [ ] helper to customize config
 * [ ] expose ports
