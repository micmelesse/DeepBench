pwd=`pwd`
docker_dir=/`basename $pwd`
docker run -v=`pwd`:$docker_dir -w $docker_dir --device='/dev/kfd' --device='/dev/dri' --group-add video -it micmelesse/miopen_deepbench