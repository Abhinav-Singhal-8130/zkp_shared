import argparse
import json
import numpy as np

# Set up the argument parser
parser = argparse.ArgumentParser(description='Create random integer matrices of specified shape and save them in a JSON file.')

parser.add_argument('--out_file', type=str, help='the name of the output JSON file')
parser.add_argument('--matrix_shapes', type=json.loads, help='a JSON-encoded dictionary of matrix names and shapes')
parser.add_argument('--seed', type=int, help='numpy randomness seed value')

# Parse the command line arguments
args = parser.parse_args()
if args.seed is not None:
	np.random.seed(args.seed)
# Generate the matrices
matrices = {}
for matrix_name, matrix_shape in args.matrix_shapes.items():
    matrix = np.random.randint(0, 100, matrix_shape)
    matrices[matrix_name] = matrix.tolist()

# Write the matrices to the output file
with open(args.out_file, 'w') as f:
    json.dump(matrices, f)

# input format 
# python3 '<output_file.json>' '{"matrix1": [dim1, dim2], "matrix2": [dim1, dim2, dim3]}'
