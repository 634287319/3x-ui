# 下载二进制
wget -O /usr/local/x-ui-linux-amd64.tar.gz https://github.com/634287319/3x-ui/releases/latest/download/x-ui-linux-amd64.tar.gz

# 解压和部署
cd /usr/local
tar zxvf x-ui-linux-amd64.tar.gz
cd x-ui
chmod +x x-ui
cp -f x-ui.service /etc/systemd/system/

# 设置默认账号
/usr/local/x-ui/x-ui setting -username admin -password admin123 -port 54321 -webBasePath webxyz

# 启动服务
systemctl daemon-reload
systemctl enable x-ui
systemctl start x-ui

echo "访问地址: http://$(curl -s https://api.ipify.org):54321/webxyz"
