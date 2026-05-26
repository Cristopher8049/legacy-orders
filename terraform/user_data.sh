#!/bin/bash
set -eux

yum update -y
yum install -y git nodejs npm

APP_DIR="/opt/legacy-app"

rm -rf $APP_DIR
git clone -b main ${repo_url} $APP_DIR

cd $APP_DIR

if [ -f package-lock.json ]; then
  npm ci
else
  npm install
fi

cat > /etc/systemd/system/legacy-app.service <<SERVICE
[Unit]
Description=Legacy Node.js Application
After=network.target

[Service]
Type=simple
WorkingDirectory=$APP_DIR
Environment=PORT=${app_port}
ExecStart=/usr/bin/npm start
Restart=always
RestartSec=10
User=root

[Install]
WantedBy=multi-user.target
SERVICE

systemctl daemon-reload
systemctl enable legacy-app
systemctl start legacy-app