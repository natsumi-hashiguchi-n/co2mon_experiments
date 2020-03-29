# co2mon

Hec-EyeにつながるCO2モニタ

## ビルド

```sh
docker buildx create --use         # 最初の1回のみ
docker buildx inspect --bootstrap  # 最初の1回のみ
./docker_build.sh
```

## DockerイメージをRaspberryPiに転送する

```sh
docker image save co2mon | ssh cm01.local docker image load
```

## コンテナの起動

```sh
docker run --privileged --rm --device /dev/ttyACM0 --name co2mon co2mon /sbin/init
```

## コンテナのシェルを開く

```sh
docker exec -it co2mon /bin/bash
```
