#!/bin/bash
set -e

# 1. 安装依赖
apt update -y && apt install -y curl wget tar

# 2. 下载并解压你的 x-ui 版本
wget -O /usr/local/x-ui-linux-amd64.tar.gz https://your.custom.domain/path/to/tar.gz
cd /usr/local
tar zxvf x-ui-linux-amd64.tar.gz
cd x-ui
chmod +x x-ui
cp -f x-ui.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable x-ui
systemctl start x-ui

# 3. 设置默认账号密码等
/usr/local/x-ui/x-ui setting -username admin -password admin123 -port 54321 -webBasePath web123

# 4. 输出访问信息
echo "访问地址：http://$(curl -s https://api.ipify.org):54321/web123"
