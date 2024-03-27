<div align="center">
	<p><img src="https://em-content.zobj.net/thumbs/160/apple/325/stethoscope_1fa7a.png" width="100px"></p>
	<h1>metrics-server</h1>
	<p>Built-from-source container image of <a href="https://github.com/kubernetes-sigs/metrics-server">metrics-server</a></p>
	<code>docker pull quay.io/ricardbejarano/metrics-server</code>
</div>


## Features

* Compiled from source during build time
* Built `FROM scratch`, with zero bloat
* Reduced attack surface (no shell, no UNIX tools, no package manager...)
* Runs as unprivileged (non-`root`) user


## Tags

### Docker Hub

Available on Docker Hub as [`docker.io/ricardbejarano/metrics-server`](https://hub.docker.com/r/ricardbejarano/metrics-server):

- [`0.7.1`, `latest` *(Dockerfile)*](Dockerfile)

### RedHat Quay

Available on RedHat Quay as [`quay.io/ricardbejarano/metrics-server`](https://quay.io/repository/ricardbejarano/metrics-server):

- [`0.7.1`, `latest` *(Dockerfile)*](Dockerfile)
