# v8docker
V8 Engine docker image for lab testing


[+] container中包含了v8的源码，只需要调整到所需要的版本并编译即可；

[+] 创建docker方式如下

```
#workdir : /V8/test
docker run -d --rm --name v8version -v test_dir:/V8/test --cap-add=SYS_PTRACE ma5ker/v8docker
docker exec -it v8version /bin/bash
```

如果不想stop后删除容器的话，就去掉`--rm`命令
