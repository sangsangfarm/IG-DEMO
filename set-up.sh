echo "make start.sh"
echo "
mkdir -p $PWD/private/ig100-basic-private/logs
mkdir -p $PWD/private/ig100-commerical-private/logs
mkdir -p $PWD/private/ig100-research-private/logs
cp $PWD/private/ig100-basic-private/default_twin.log $PWD/private/ig100-basic-private/logs/twin.log
cp $PWD/private/ig100-commerical-private/default_twin.log $PWD/private/ig100-commerical-private/logs/twin.log
cp $PWD/private/ig100-research-private/default_twin.log $PWD/private/ig100-research-private/logs/twin.log

docker compose -f $PWD/private/ig100-basic-private/docker-compose.yml up -d
docker compose -f $PWD/private/ig100-commerical-private/docker-compose.yml up -d
docker compose -f $PWD/private/ig100-research-private/docker-compose.yml up -d

mkdir -p $PWD/public/ig100-basic-public/logs
mkdir -p $PWD/public/ig100-commerical-public/logs
mkdir -p $PWD/public/ig100-research-public/logs
cp $PWD/public/ig100-basic-public/default_twin.log $PWD/public/ig100-basic-public/logs/twin.log
cp $PWD/public/ig100-commerical-public/default_twin.log $PWD/public/ig100-commerical-public/logs/twin.log
cp $PWD/public/ig100-research-public/default_twin.log $PWD/public/ig100-research-public/logs/twin.log

docker compose -f $PWD/public/ig100-basic-public/docker-compose.yml up -d
docker compose -f $PWD/public/ig100-commerical-public/docker-compose.yml up -d
docker compose -f $PWD/public/ig100-research-public/docker-compose.yml up -d
" > $PWD/start.sh
sudo chmod +x $PWD/start.sh


echo "make stop.sh"
echo "docker compose -f $PWD/private/ig100-basic-private/docker-compose.yml down
docker compose -f $PWD/private/ig100-commerical-private/docker-compose.yml down
docker compose -f $PWD/private/ig100-research-private/docker-compose.yml down
docker compose -f $PWD/public/ig100-basic-public/docker-compose.yml down
docker compose -f $PWD/public/ig100-commerical-public/docker-compose.yml down
docker compose -f $PWD/public/ig100-research-public/docker-compose.yml down
" > $PWD/stop.sh
sudo chmod +x $PWD/stop.sh

echo "set up systemd service"

echo "[Unit]
Description=Run Demo
After=network.target

[Service]
ExecStart=bash $PWD/start.sh
Type=simple
User=$USER
Restart=always

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/ig-demo.service

sudo systemctl daemon-reload
sudo systemctl enable ig-demo.service
sudo systemctl start ig-demo.service
sudo systemctl status ig-demo.service
