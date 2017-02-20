


```bash
git clone .
cd s2inode
s2i build . bucharestgold/centos7-s2i-nodejs:current webapp
docker run -it -p 8080:8080 webapp
```