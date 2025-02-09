

mkdir -p private/ig100-basic-private/logs
mkdir -p private/ig100-commerical-private/logs
mkdir -p private/ig100-research-private/logs
cp private/ig100-basic-private/default_twin.log private/ig100-basic-private/logs/twin.log
cp private/ig100-commerical-private/default_twin.log private/ig100-commerical-private/logs/twin.log
cp private/ig100-research-private/default_twin.log private/ig100-research-private/logs/twin.log

docker compose -f private/ig100-basic-private/docker-compose.yml up -d
docker compose -f private/ig100-commerical-private/docker-compose.yml up -d
docker compose -f private/ig100-research-private/docker-compose.yml up -d

mkdir -p public/ig100-basic-public/logs
mkdir -p public/ig100-commerical-public/logs
mkdir -p public/ig100-research-public/logs
cp public/ig100-basic-public/default_twin.log public/ig100-basic-public/logs/twin.log
cp public/ig100-commerical-public/default_twin.log public/ig100-commerical-public/logs/twin.log
cp public/ig100-research-public/default_twin.log public/ig100-research-public/logs/twin.log

docker compose -f public/ig100-basic-public/docker-compose.yml up -d
docker compose -f public/ig100-commerical-public/docker-compose.yml up -d
docker compose -f public/ig100-research-public/docker-compose.yml up -d
