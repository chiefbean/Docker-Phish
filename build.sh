docker rm phisher
docker build -t phish .
docker run --privileged --name phisher -p 3000:3000 -p 3333:3333 -p 443:443  --mount type=bind,source="$(pwd)"/data,target=/data phish