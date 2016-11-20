# Zcash

Run https://z.cash/ with just a couple commands.

For a complete setup, check out https://github.com/WyseNynja/zcash-suite/

If you already setup a node with this repo and rocker-compose, run these commands to migrate:

```bash
export ZCASH_HOME=~/zcash-suite

docker rm -f zcash.mainnet
mkdir -p "$ZCASH_HOME"
mv ./data ~/zcash-suite/data
```


# Todo

 * [ ] write docs


# Authors

Donations are much appreciated!

 - Bryan Stitt <bryan at stitthappens.com>
     - Bitcoin: 17vi3UfTYNRi6RnWRbhv7nXBH66c4gVYEV
     - Zcash: t1NEaED2QeEYckpc3WGdQrn2yPV9ujwk5gr
     - Zcash: zcGWtivu6xbzE9rdKaxFHXy9TjDsu1tw76sxGp83SCVeYn8DwRYNsWfexqhuvSWvr411V3niiwWRkCcTu8Xm2hVKhkQzFB6
