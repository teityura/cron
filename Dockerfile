FROM alpine

RUN set -x && \
  apk --no-cache add bash tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata

RUN cp -a /etc/periodic/15min /etc/periodic/1min

CMD ["crond", "-f", "-l", "1"]
