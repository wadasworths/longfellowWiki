### Centos 7 with Docker

```shell
# 更新yum

sudo yum update

# 卸载centos旧的docker，并安装需要的安装包
sudo yum remove docker  docker-common docker-selinux docker-engine
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# 增加repo
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 查看所有的仓库中所有docker版本
yum list docker-ce --showduplicates | sort -r


```