# s2i-nodejs

A basic Hapi app as base to be built using [origin-s2i-nodejs](https://github.com/bucharest-gold/origin-s2i-nodejs) docker image.


```bash
git clone git@github.com:bucharest-gold/s2i-nodejs.git
cd s2inode
s2i build . bucharestgold/centos7-s2i-nodejs:current webapp
docker run -it -p 8080:8080 webapp
```