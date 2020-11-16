<p align="center"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/apple/198/chart-with-upwards-trend_1f4c8.png" width="120px"></p>
<h1 align="center">metrics-server (container image)</h1>
<p align="center">Built-from-source container image of Kubernetes' <a href="https://github.com/kubernetes-incubator/metrics-server">metrics-server</a></p>


## Tags

### Docker Hub

Available on [Docker Hub](https://hub.docker.com) as [`ricardbejarano/metrics-server`](https://hub.docker.com/r/ricardbejarano/metrics-server):

- [`0.4.0-glibc`, `0.4.0`, `glibc`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/metrics-server/blob/master/Dockerfile.glibc) (about `49.4MB`)
- [`0.4.0-musl`, `musl` *(Dockerfile.musl)*](https://github.com/ricardbejarano/metrics-server/blob/master/Dockerfile.musl) (about `49.4MB`)

### Quay

Available on [Quay](https://quay.io) as:

- [`quay.io/ricardbejarano/metrics-server`](https://quay.io/repository/ricardbejarano/metrics-server), [`quay.io/ricardbejarano/metrics-server-glibc`](https://quay.io/repository/ricardbejarano/metrics-server-glibc), tags: [`0.4.0`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/metrics-server/blob/master/Dockerfile.glibc) (about `49.4MB`)
- [`quay.io/ricardbejarano/metrics-server-musl`](https://quay.io/repository/ricardbejarano/metrics-server-musl), tags: [`0.4.0`, `master`, `latest` *(Dockerfile.musl)*](https://github.com/ricardbejarano/metrics-server/blob/master/Dockerfile.musl) (about `49.4MB`)


## Features

* Super tiny (see [Tags](#tags))
* Compiled from source during build time
* Built `FROM scratch`, with zero bloat (see [Filesystem](#filesystem))
* Reduced attack surface (no shell, no UNIX tools, no package manager...)
* Runs as unprivileged (non-`root`) user


## Building

- To build the `glibc`-based image: `docker build -t metrics-server:glibc -f Dockerfile.glibc .`
- To build the `musl`-based image: `docker build -t metrics-server:musl -f Dockerfile.musl .`


## Deploying

To deploy `metrics-server` to your Kubernetes cluster, run:

```bash
kubectl apply -f ./kubernetes
```


## Filesystem

```
/
├── apiserver.local.config/
├── etc/
│   ├── group
│   └── passwd
└── metrics-server
```


## License

See [LICENSE](https://github.com/ricardbejarano/metrics-server/blob/master/LICENSE).
