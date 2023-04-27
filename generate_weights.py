import numpy as np
import argparse
import json

parser = argparse.ArgumentParser()

parser.add_argument('--seed', type = int, default=42, help = 'random seed')
parser.add_argument('--layers', nargs="+", help = 'input and layer sizes')
parser.add_argument('--out_file', type = str, default = 'params.json')


args = parser.parse_args()
seed = args.seed
layers = args.layers
out_file = args.out_file

np.random.seed(seed)

dict1 = {}
for i in range(1, len(layers)):
    dict1["wts"+str(i)] = np.random.randint(0, 100, size=(int(layers[i]), int(layers[i-1]))).tolist()
    dict1["bias"+str(i)] = np.random.randint(0, 100, size=(int(layers[i]), 1)).tolist()

with open(out_file, 'w') as f:
    json.dump(dict1, f)
    

