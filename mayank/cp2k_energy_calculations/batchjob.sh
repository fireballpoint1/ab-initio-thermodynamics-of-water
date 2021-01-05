#!/bin/bash
#SBATCH -A research
#SBATCH --qos=medium
#SBATCH -n 12
#SBATCH --gres=gpu:0
#SBATCH --mem-per-cpu=8192
#SBATCH --time=4-00:00:00
#SBATCH --mail-type=END

#~/cp2k-7.1-Linux-x86_64.ssmp -i input_training/input2.in -o output_training/output2.in
sh automate_cp2k_calculation.sh
