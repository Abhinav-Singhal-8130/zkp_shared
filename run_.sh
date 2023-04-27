file=$1
dir=$2
log="${3:-log.txt}"




cp run.sh $file/
cd $file
./run.sh $file $log