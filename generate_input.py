import numpy as np
import argparse
import json

parser = argparse.ArgumentParser()

parser.add_argument('--seed', type = int, default=42, help = 'random seed')
parser.add_argument('--size', type = int, help = 'input array length')
parser.add_argument('--out_file', type = str, default = 'input0.json')


args = parser.parse_args()
seed = args.seed
len = args.size
out_file = args.out_file

np.random.seed(seed)
input = np.random.randint(0, 100, size = [len, 1]).tolist()
dict1 = {'input': input}
with open(out_file, 'w') as f:
    json.dump(dict1, f)
# with open("dense_relu_l1/input.json") as f:
    
