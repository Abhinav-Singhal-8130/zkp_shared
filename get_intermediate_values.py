import torch
import numpy as np
import os
import json

with open('input0.json') as f:
    input = json.load(f)
with open('params.json') as f:
    params = json.load(f)

print ( params)

folder1 = "Dense_relu_l1"
folder2 = "Dense_relu_l2"
folder3 = "Dense_relu_l3"
folder4 = "Dense_relu_l4"
folders = [folder1, folder2, folder3, folder4]

input_temp = np.array(input["input"])

'''
'''


def perceptron (weights, inputs, bias):
    return np.maximum (0, weights @ inputs + bias)




for i, folder in enumerate(folders):
    if (not os.path.exists(folder)):
        os.mkdir(folder)
    
    weights_temp = np.array(params['wts' + str(i+1)])
    bias_temp = np.array (params['bias'+ str(i+1)])
    out_temp = perceptron (weights_temp, np.array(input_temp), bias_temp)
    
    input_dict = {"in": input_temp.tolist(), "weights": weights_temp.tolist(), "bias": bias_temp.tolist()}
    
    input_temp = out_temp
    
    with open(folder+'/input.json', 'w') as f:
        json.dump(input_dict, f)

    


