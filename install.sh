#!/bin/bash
set -e
apt update && apt install -y curl wget tar

arch=$(uname -m)
case "$arch" in
  x86_64|amd64) arch="amd64" ;;
  aarch64|arm64) arch="arm64" ;;
  *) echo "Unsupported arch: $arch"; exit 1 ;;
esac

cd /usr/local
wget -O x-ui-linux-${arch}.tar.gz https://github.com/634287319/3x-ui/releases/latest/download/x-ui-linux-${arch}.tar.gz
tar zxvf x-ui-linux-${arch}.tar.gz
cd x-ui
chmod +x x-ui
cp -f x-ui.service /etc/systemd/system/

# 启用服务
systemctl daemon-reload
systemctl enable x-ui
systemctl start x-ui

# 默认账号密码+路径
username="admin"
password="admin123"
port="54321"
webBasePath="xui"

# 设置
/usr/local/x-ui/x-ui setting -username $username -password $password -port $port -webBasePath $webBasePath
echo "X-UI安装完成"
echo "访问地址: http://$(curl -s https://api.ipify.org):$port/$webBasePath"
