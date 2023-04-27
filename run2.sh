in1=$1
l1=$2
l2=$3
l3=$4
l4=$5

python3 generate_input.py --size $in1
python3 generate_weights.py --layers $in1 $l1 $l2 $l3 $l4

rm -rf dense_relu_l1/*
rm -rf dense_relu_l2/*
rm -rf dense_relu_l3/*
rm -rf dense_relu_l4/*

python3 get_intermediate_values.py





