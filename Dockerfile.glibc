FROM golang:1 AS build

ARG VERSION="0.3.6"
ARG CHECKSUM="cb0626b297eeb14be20f53896bc0cd68b32d20a4e4b6c8becdef625e322a54ed"

ADD https://github.com/kubernetes-incubator/metrics-server/archive/v$VERSION.tar.gz /tmp/metrics-server.tar.gz

RUN [ "$CHECKSUM" = "$(sha256sum /tmp/metrics-server.tar.gz | awk '{print $1}')" ] && \
    mkdir -p /go/src/github.com/kubernetes-incubator && \
    tar -C /go/src/github.com/kubernetes-incubator -xf /tmp/metrics-server.tar.gz && \
    mv /go/src/github.com/kubernetes-incubator/metrics-server-$VERSION /go/src/github.com/kubernetes-incubator/metrics-server

RUN cd /go/src/github.com/kubernetes-incubator/metrics-server && \
      go run vendor/k8s.io/kube-openapi/cmd/openapi-gen/openapi-gen.go --logtostderr -i k8s.io/metrics/pkg/apis/metrics/v1beta1,k8s.io/apimachinery/pkg/apis/meta/v1,k8s.io/apimachinery/pkg/api/resource,k8s.io/apimachinery/pkg/version -p github.com/kubernetes-incubator/metrics-server/pkg/generated/openapi/ -O zz_generated.openapi -h /go/src/github.com/kubernetes-incubator/metrics-server/hack/boilerplate.go.txt -r /dev/null && \
      CGO_ENABLED=0 go build -o /tmp/metrics-server github.com/kubernetes-incubator/metrics-server/cmd/metrics-server && \
    echo "nogroup:*:100:nobody" > /tmp/group && \
    echo "nobody:*:100:100:::" > /tmp/passwd && \
    mkdir -p /tmp/apiserver.local.config


FROM scratch

COPY --from=build --chown=100:100 /tmp/metrics-server /
COPY --from=build --chown=100:100 /tmp/apiserver.local.config /apiserver.local.config
COPY --from=build --chown=100:100 /tmp/group \
                                  /tmp/passwd \
                                  /etc/

USER 100:100
EXPOSE 8443/tcp
ENTRYPOINT ["/metrics-server"]
CMD ["--logtostderr", "--secure-port=8443"]
