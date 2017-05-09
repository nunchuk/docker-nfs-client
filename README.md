# docker-nfs-client
A minimal Docker image ( ~12 MB ) based on Alpine Linux, for Docker volume shares by nfs service.

## Usage

```
docker run -tid --privileged=true --name=nfs \
-e VERSION=NFSv4 \
-e SERVER=you.nas.net \
-e SOURCE=/ \
-e DESTINATION=/mnt/nas \
registry.cn-beijing.aliyuncs.com/nunchuk/nfs-client:latest
```

* `VERSION` - NFS type: `NFSv3`, `NFSv4`
* `SERVER` - Server address
* `SOURCE` - Mountpoint, default: `/`
* `DESTINATION` - Local filesystem target, default: `/mnt`

Additionally, a mounted directory unable to share volumes between containers. [#4213](https://github.com/moby/moby/issues/4213) e.g.`docker run --rm -ti --volumes-from=nfs alpine:latest /bin/sh`

Contributors
-------------------
* XinYe ( nunchuk@live.com )