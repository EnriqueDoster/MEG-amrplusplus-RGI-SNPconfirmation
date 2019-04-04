#!/bin/bash
#SBATCH --job-name=nf_HMM
#SBATCH --partition=shas
#SBATCH --ntasks=1
#SBATCH --qos=long
#SBATCH --cpus-per-task=1
#SBATCH --time=100:00:00
#SBATCH --export=ALL
#SBATCH --mail-user=enriquedoster@gmail.com
#SBATCH --mail-type=ALL

module purge
module load jdk/1.8.0
module load singularity/2.5.2
module load gnu_parallel/20160622
module load gcc/6.1.0
module load openmpi/2.0.1

mpirun --pernode ./nextflow run main_amrplusplus_RGI.nf --reads "/scratch/summit/edoster@colostate.edu/proj3_amrplusplus_results/BAMToFASTQ/*R{1,2}.fastq.gz" \
 --output /scratch/summit/edoster@colostate.edu/Proj3_amrplusplus_SNP_confirmed --threads 24 /scratch/summit/edoster@colostate.edu/work_p3 \
 --host /scratch/summit/edoster@colostate.edu/mod_bos_taurus.fna -profile slurm -resume -with-mpi
