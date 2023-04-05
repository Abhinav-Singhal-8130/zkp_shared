file=$1
dir=$2
log="${3:-log.txt}"

if [ -e $dir ];then rm -rf $dir ; fi  
mkdir $dir

cp run.sh $dir/
python3 p1.py --out_file "$dir/input.json" --seed 42 --matrix_shapes '{"in1": [250], "wts1": [250, 256], "wts2": [256, 256], "wts3" : [256, 256],"wts4" : [256, 12], "bias1" : [256], "bias2" : [256], "bias3" : [256], "bias4" : [12]}'
cd $dir
./run.sh $file $log