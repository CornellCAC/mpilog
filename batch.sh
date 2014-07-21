#!/bin/bash
#SBATCH -p development
#SBATCH -A AdminStampede
##SBATCH -A your_account_name_goes_here
#SBATCH -J mpi4py-demo
#SBATCH -o mpi4py-demo.o%j
#SBATCH -n 16
#SBATCH -t 00:05:00

# Prohibit writing core files on error.
ulimit -c 0

set -x
python receiver.py &
ibrun python sample.py --loghost `hostname` --level debug
pkill python
