<p align="center"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/apple/198/chart-with-upwards-trend_1f4c8.png" width="120px"></p>
<h1 align="center">metrics-server (container image)</h1>
<p align="center">Built-from-source container image of <a href="https://kubernetes.io/">Kubernetes</a>' <a href="https://github.com/kubernetes-sigs/metrics-server">metrics-server</a></p>


## Tags

### Docker Hub

Available on Docker Hub as [`docker.io/ricardbejarano/metrics-server`](https://hub.docker.com/r/ricardbejarano/metrics-server):

- [`0.5.0`, `latest` *(Dockerfile)*](Dockerfile)

### RedHat Quay

Available on RedHat Quay as [`quay.io/ricardbejarano/metrics-server`](https://quay.io/repository/ricardbejarano/metrics-server):

- [`0.5.0`, `latest` *(Dockerfile)*](Dockerfile)


## Features

* Compiled from source during build time
* Built `FROM scratch`, with zero bloat
* Statically linked to the [`musl`](https://musl.libc.org/) implementation of the C standard library
* Reduced attack surface (no shell, no UNIX tools, no package manager...)
* Runs as unprivileged (non-`root`) user


## Building

```bash
docker build --tag ricardbejarano/metrics-server --file Dockerfile .
```


## License

MIT licensed, see [LICENSE](LICENSE) for more details.
