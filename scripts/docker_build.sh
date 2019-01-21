path=./docker/miopen_deepbench.Dockerfile
file=`basename "$path"`
filename="${file%.*}"
docker build --network=host -t micmelesse/$filename -< $path