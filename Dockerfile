FROM golang:1-alpine AS build

ARG VERSION="0.4.5"
ARG CHECKSUM="c5b1ed7d89d9a121dbda397e4d32249d6d91dd5ecb2bcc81e25887124e64d20d"

ADD https://github.com/kubernetes-sigs/metrics-server/archive/v$VERSION.tar.gz /tmp/metrics-server.tar.gz

RUN [ "$(sha256sum /tmp/metrics-server.tar.gz | awk '{print $1}')" = "$CHECKSUM" ] && \
    apk add make && \
    tar -C /tmp -xf /tmp/metrics-server.tar.gz && \
    mkdir -p /go/src/sigs.k8s.io && \
    mv /tmp/metrics-server-$VERSION /go/src/sigs.k8s.io/metrics-server && \
    cd /go/src/sigs.k8s.io/metrics-server && \
      make metrics-server

RUN mkdir -p /rootfs/apiserver.local.config && \
    mkdir -p /rootfs/bin && \
      cp /go/src/sigs.k8s.io/metrics-server/metrics-server /rootfs/bin/ && \
    mkdir -p /rootfs/etc && \
      echo "nogroup:*:10000:nobody" > /rootfs/etc/group && \
      echo "nobody:*:10000:10000:::" > /rootfs/etc/passwd


FROM scratch

COPY --from=build --chown=10000:10000 /rootfs /

USER 10000:10000
EXPOSE 8443/tcp
ENTRYPOINT ["/bin/metrics-server"]
CMD ["--logtostderr", "--secure-port=8443"]
