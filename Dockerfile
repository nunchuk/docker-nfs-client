############################################################ 
# Dockerfile to build NFS-Client image 
# Based on Alpine:3.5
############################################################

FROM registry.cn-beijing.aliyuncs.com/nunchuk/alpine:latest
MAINTAINER XinYe <nunchuk@live.com>

# Intstall nfs
RUN apk --update add --no-cache nfs-utils

# Clean up
RUN rm -rf /var/cache/apk/*

ENV SERVER= \
    VERSION= \
    SOURCE= \
    DESTINATION=/mnt

# Add mount script
COPY run.sh /run.sh
RUN chmod +x /run.sh

VOLUME ${DESTINATION}

ENTRYPOINT ["/run.sh"]