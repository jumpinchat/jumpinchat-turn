# docker-turn

## building
`docker build -t coturn_server .`

**note** Certs and a DH param are required, and should be copied to `/etc/certs/` in the container

## running
```bash
docker run \
  -t \
  -i \
  --name=turnserver \
  --restart="on-failure:10" \
  --net=host \
  -p 3478:3478 \
  -p 3478:3478/udp \
  -p 5349:5349 \
  -p 5349:5349/udp \
  coturn_server
```
