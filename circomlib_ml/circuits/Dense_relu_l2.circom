pragma circom 2.0.0;

include "./Dense.circom";
include "./ReLU.circom";
// Dense layer
template Dense_relu_l2 (nInputs,nOutputs) {
    signal input in[nInputs];
    signal input weights[nInputs][nOutputs];
    signal input bias[nOutputs];
    signal output out[nOutputs];

    component Dense_comp;
    component Relu_comp[nOutputs];

    for(var i = 0;i<nOutputs;i++) {Relu_comp[i] = ReLU();}
    Dense_comp = Dense(nInputs, nOutputs);

    for(var i = 0;i<nInputs;i++){
        Dense_comp.in[i] <== in[i];
    }

    for(var i = 0;i<nInputs;i++){
        for(var j = 0;j<nOutputs;j++){
            Dense_comp.weights[i][j] <== weights[i][j];
        }
    }

    for(var i = 0;i<nOutputs;i++){
        Dense_comp.bias[i] <== bias[i];
    }

    for(var i = 0;i<nOutputs;i++){
        Relu_comp[i].in <== Dense_comp.out[i];
    }
    for(var i = 0;i<nOutputs;i++){
        out[i] <== Relu_comp[i].out;
    }





}

component main {public [in]} = Dense_relu_l2 (4, 5);