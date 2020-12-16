# docker-ossutil

[![](https://github.com/maskzh/docker-ossutil/workflows/CI%20to%20Docker%20Hub/badge.svg)](https://github.com/maskzh/docker-ossutil/actions)
[![](https://img.shields.io/docker/pulls/maskzh/docker-ossutil.svg)](https://hub.docker.com/r/maskzh/docker-ossutil)

Build a image with [ossutil](https://github.com/aliyun/ossutil).

### Use in Drone CI

```
- name: upload to aliyun oss
  image: maskzh/docker-ossutil
  commands:
    - ossutil cp ./build/static oss://bucket/path -r --update --config-file ./ossutilconfig
```
