# ZKP

Run the command
./dnn_s.sh DNN_S dnn_s log.txt
./dnn_m.sh DNN_M dnn_m log.txt
./dnn_l.sh DNN_L dnn_l log.txt

change power of tau parameter at line 44 in run.sh

s - small
m - medium
l - large

Already ran the small model. Now medium and large models need to be executed.

#new task

Generate input files for individual layers
 ./run2.sh 3 4 5 6 7

These are dummy weights. If we require to test with different weights, then change Dense_relu_l1-l4.circom files as well


Generation and verification of proofs of individual layers 
 ./run_.sh Dense_relu_l1  
 ./run_.sh Dense_relu_l2  
 ./run_.sh Dense_relu_l3  
 ./run_.sh Dense_relu_l4