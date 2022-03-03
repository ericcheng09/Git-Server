# Git server over http
A simple git server over http, supporting initializing repo, http user and password through enviroment variables.


## Build Image
```yaml
sudo docker build -t git-server .
```

## Usage

### Start Server
```bash
sudo docker run -d --restart=always \
 -p 8080:5000 \
 -e REPO=example-repo \
 -e REPO_USER=user \
 -e REPO_PASS=password \
 -e PREFIX /example/prefix \
 -v /path/to/volume:/srv/git \
 git-server
```

### clone 
```yaml
git clone http://localhost:8080/example/prefix/example-repo.git
```

## Ref
https://git-scm.com/book/zh-tw/v2/%E4%BC%BA%E6%9C%8D%E5%99%A8%E4%B8%8A%E7%9A%84-Git-Smart-HTTP
