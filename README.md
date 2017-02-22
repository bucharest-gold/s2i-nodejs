# s2i-nodejs

A basic Hapi app as base to be built using [origin-s2i-nodejs](https://github.com/bucharest-gold/origin-s2i-nodejs) docker image.

## Creating a s2i image with [origin-s2i-nodejs](https://github.com/bucharest-gold/origin-s2i-nodejs)

Download the [s2i binary](https://github.com/openshift/source-to-image/releases) and put in your path.

```bash
git clone git@github.com:bucharest-gold/s2i-nodejs.git
cd s2i-nodejs
s2i build . bucharestgold/centos7-s2i-nodejs s2i-nodejs
```

Run:

```bash
docker run -it -p 8080:8080 s2i-nodejs
```

You can specify the node.js version too.

```bash
s2i build . bucharestgold/centos7-s2i-nodejs:4.7.3 s2i-nodejs
```

> To see a list of Node.js versions: [https://hub.docker.com/r/bucharestgold/centos7-nodejs/tags/](https://hub.docker.com/r/bucharestgold/centos7-nodejs/tags/)


## Using Openshift origin client tools

Download the [oc binary](https://github.com/openshift/origin/releases/) and put in your path.

```bash
oc new-app bucharestgold/centos7-s2i-nodejs:7.5.0~https://github.com/bucharest-gold/s2i-nodejs.git
```

TBD...

## The app

```bash
npm install 
npm start
```

```bash
$ npm start

http://0.0.0.0:8080
  GET    /                              Say hello!
  GET    /info                          Informations about the Operating system.
  GET    /status                        

Server running at: http://0.0.0.0:8080
```

Go to '/' and you will see a 'hello':

`
Hello Hapi!
`

Go to '/info' and you will see info about your server:

```
Server info:
Host: hf-ThinkPad-T440
OS Type: Linux
OS Platform: linux
OS Arch: x64
OS Release: 4.4.0-63-generic
OS Uptime: 5269
OS Free memory: 7690.61328125mb
OS Total memory: 11705.98046875mb
OS CPU count: 4
OS CPU model: Intel(R) Core(TM) i7-4600U CPU @ 2.10GHz
OS CPU speed: 3002mhz
```

Go to '/status' and you will see more CPU, memory info:

![Alt a](https://github.com/bucharest-gold/s2i-nodejs/raw/master/a.png)

```bash
git clone git@github.com:bucharest-gold/s2i-nodejs.git
cd s2inode
s2i build . bucharestgold/centos7-s2i-nodejs:current webapp
docker run -it -p 8080:8080 webapp
```