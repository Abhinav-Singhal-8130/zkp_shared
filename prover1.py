import numpy as np
import torch
import argparse

parser = argparse.ArgumentParser

parser.add_argument(--seed, type='int', default=42)

parser.add_argument('--in_file', type='str', default = 'Dense', help='get input values')

parser.add_argument('')

args = parser.parse_args()



