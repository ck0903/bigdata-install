#!/bin/bash
################################################################################
## Copyright:   HZGOSUN Tech. Co, BigData
## Filename:    zookeeperStart.sh
## Description: 启动zookeeper集群的脚本.
## Version:     1.0
## Author:      lidiliang
## Created:     2017-10-23
################################################################################

#set -x

cd `dirname $0`
## 脚本所在目录
BIN_DIR=`pwd`
cd ..
## 安装包根目录
ROOT_HOME=`pwd`
## 配置文件目录
CONF_DIR=${ROOT_HOME}/conf
## 安装日记目录
LOG_DIR=${ROOT_HOME}/logs
## 安装日记目录
LOG_FILE=${LOG_DIR}/zookeeperStart.log
## 最终安装的根目录，所有bigdata 相关的根目录
INSTALL_HOME=$(sed -n '4p' ${CONF_DIR}/install_home.properties)

for name in $(cat ${CONF_DIR}/hostnamelists.properties)
do
    ssh root@$name "source /etc/profile;${INSTALL_HOME}/Zookeeper/zookeeper/bin/zkServer.sh start"
done

