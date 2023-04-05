file=$1
dir=$2
log="${3:-log.txt}"

if [ -e $dir ];then rm -rf $dir ; fi  
mkdir $dir

cp run.sh $dir/
python3 p1.py --out_file "$dir/input.json" --seed 42 --matrix_shapes '{"in1": [250], "wts1": [250, 144], "wts2": [144, 144], "wts3" : [144, 144],"wts4" : [144, 12], "bias1" : [144], "bias2" : [144], "bias3" : [144], "bias4" : [12]}'
cd $dir
./run.sh $file $log