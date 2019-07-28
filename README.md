<p align=center><img src=https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/apple/198/chart-with-upwards-trend_1f4c8.png width=120px></p>
<h1 align=center>metrics-server (container image)</h1>
<p align=center>Minimal container image of Kubernetes' <a href=https://github.com/kubernetes-incubator/metrics-server>metrics-server</a></p>


## Tags

### Docker Hub

Available on [Docker Hub](https://hub.docker.com) as [`ricardbejarano/metrics-server`](https://hub.docker.com/r/ricardbejarano/metrics-server):

- [`0.3.3-glibc`, `0.3.3`, `glibc`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/metrics-server/blob/master/Dockerfile.glibc)
- [`0.3.3-musl`, `musl` *(Dockerfile.musl)*](https://github.com/ricardbejarano/metrics-server/blob/master/Dockerfile.musl)

### Quay

Available on [Quay](https://quay.io) as:

- [`quay.io/ricardbejarano/metrics-server-glibc`](https://quay.io/repository/ricardbejarano/metrics-server-glibc), tags: [`0.3.3`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/metrics-server/blob/master/Dockerfile.glibc)
- [`quay.io/ricardbejarano/metrics-server-musl`](https://quay.io/repository/ricardbejarano/metrics-server-musl), tags: [`0.3.3`, `master`, `latest` *(Dockerfile.musl)*](https://github.com/ricardbejarano/metrics-server/blob/master/Dockerfile.musl)


## Features

* Super tiny (`glibc`-based is `~53.5MB` and `musl`-based is `~53.5MB`)
* Compiled from source during build time
* Binary pulled from official website
* Built `FROM scratch`, see [Filesystem](#filesystem) for an exhaustive list of the image's contents
* Reduced attack surface (no shell, no UNIX tools, no package manager...)


## Building

- To build the `glibc`-based image: `docker build -t metrics-server:glibc -f Dockerfile.glibc .`
- To build the `musl`-based image: `docker build -t metrics-server:musl -f Dockerfile.musl .`


## Filesystem

The images' contents are:

### `glibc`

Based on the [glibc](https://www.gnu.org/software/libc/) implementation of `libc`. Dynamically linked.

```
/
├── apiserver.local.config/
│   └── .keep
├── etc/
│   ├── group
│   └── passwd
└── metrics-server
```

### `musl`

Based on the [musl](https://www.musl-libc.org/) implementation of `libc`. Statically linked.

```
/
├── apiserver.local.config/
│   └── .keep
├── etc/
│   ├── group
│   └── passwd
└── metrics-server
```


## License

See [LICENSE](https://github.com/ricardbejarano/metrics-server/blob/master/LICENSE).
