file=$1
dir=$2
log="${3:-log.txt}"

if [ -e $dir ];then rm -rf $dir ; fi  
mkdir $dir

cp run.sh $dir/
python3 p1.py --out_file "$dir/input.json" --seed 42 --matrix_shapes '{"in1": [250], "wts1": [250, 436], "wts2": [436, 436], "wts3" : [436, 436],"wts4" : [436, 12], "bias1" : [436], "bias2" : [436], "bias3" : [436], "bias4" : [12]}'
cd $dir
./run.sh $file $log