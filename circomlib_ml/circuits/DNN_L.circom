pragma circom 2.0.0;

include "./circomlib-matrix/matMul.circom";
include "./Dense_with_relu.circom";
// Dense layer
template DNN (i1, o1, i2, o2, i3, o3, i4, o4) {
    signal input in1[i1];
    signal input wts1[i1][o1];
    signal input wts2[i2][o2];
    signal input wts3[i3][o3];
    signal input wts4[i4][o4];
    signal input bias1[o1];
    signal input bias2[o2];
    signal input bias3[o3];
    signal input bias4[o4];
    signal out1[o1];
    signal out2[o2];
    signal out3[o3];
    signal output out4[o4];

    component Dense1 = Dense_with_relu(i1, o1);
    component Dense2 = Dense_with_relu(i2, o2);
    component Dense3 = Dense_with_relu(i3, o3);
    component Dense4 = Dense_with_relu(i4, o4);

    //layer 1
    for (var i=0;i<i1;i++){
        Dense1.in[i] <== in1[i];
        for(var j=0;j<o1;j++){
            Dense1.weights[i][j] <== wts1[i][j];
        }
    }
    for(var j=0;j<o1;j++){
        Dense1.bias[j] <== bias1[j];
    }

    for(var j=0;j<o1;j++){
        out1[j] <== Dense1.out[j];
    }

    //layer 2
    for (var i=0;i<i2;i++){
        Dense2.in[i] <== out1[i];
        for(var j=0;j<o2;j++){
            Dense2.weights[i][j] <== wts2[i][j];
        }
    }
    for(var j=0;j<o2;j++){
        Dense2.bias[j] <== bias2[j];
    }

    for(var j=0;j<o2;j++){
        out2[j] <== Dense2.out[j];
    }

    //layer 3
    for (var i=0;i<i3;i++){
        Dense3.in[i] <== out2[i];
        for(var j=0;j<o3;j++){
            Dense3.weights[i][j] <== wts3[i][j];
        }
    }
    for(var j=0;j<o3;j++){
        Dense3.bias[j] <== bias3[j];
    }

    for(var j=0;j<o3;j++){
        out3[j] <== Dense3.out[j];
    }

    //layer 4
    for (var i=0;i<i4;i++){
        Dense4.in[i] <== out3[i];
        for(var j=0;j<o4;j++){
            Dense4.weights[i][j] <== wts4[i][j];
        }
    }
    for(var j=0;j<o4;j++){
        Dense4.bias[j] <== bias4[j];
    }

    for(var j=0;j<o4;j++){
        out4[j] <== Dense4.out[j];
    }
}

component main {public [in1]} = DNN(250, 436, 436, 436, 436, 436, 436, 12);