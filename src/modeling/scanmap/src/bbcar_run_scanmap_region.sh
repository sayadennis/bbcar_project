#!/bin/bash
#SBATCH -A b1042
#SBATCH -p genomics-gpu
#SBATCH --gres=gpu:a100:1
#SBATCH -t 48:00:00
#SBATCH -n 12
#SBATCH --mem=0
#SBATCH --mail-user=<email>
#SBATCH --mail-type=END,FAIL
#SBATCH --job-name="reg_scanmap"
#SBATCH --output=bbcar/out/bbcar_run_scanmap_region.out

. ~/anaconda3/etc/profile.d/conda.sh
conda activate bbcarenv

#### Region-level features #### 

# Clinical
python bbcar/scanmap/src/bbcar_run_scanmap.py \
    --genomic /projects/b1122/saya/scanmap_data/reg_thres.pik \
    --confound /projects/b1122/saya/scanmap_data/bbcar_clin_intindex.csv \
    --label /projects/b1122/saya/scanmap_data/bbcar_label_intindex.csv \
    --outdir /projects/b1042/ClareLab/saya/train_record/regthres_clin \
    --index /projects/b1122/saya/scanmap_data \
    --n_iter 4000 \
    > bbcar/scanmap/results/results_regthres_clin.txt
#

# Clinical + mutational signature 
python bbcar/scanmap/src/bbcar_run_scanmap.py \
    --genomic /projects/b1122/saya/scanmap_data/reg_thres.pik \
    --confound /projects/b1122/saya/scanmap_data/bbcar_clin_mut_intindex.csv \
    --label /projects/b1122/saya/scanmap_data/bbcar_label_intindex.csv \
    --outdir /projects/b1042/ClareLab/saya/train_record/regthres_clin_mut \
    --index /projects/b1122/saya/scanmap_data \
    > bbcar/scanmap/results/results_regthres_clin_mut.txt
#

# Clinical + PRS 
python bbcar/scanmap/src/bbcar_run_scanmap.py \
    --genomic /projects/b1122/saya/scanmap_data/reg_thres.pik \
    --confound /projects/b1122/saya/scanmap_data/bbcar_clin_prs_intindex.csv \
    --label /projects/b1122/saya/scanmap_data/bbcar_label_intindex.csv \
    --outdir /projects/b1042/ClareLab/saya/train_record/regthres_clin_prs \
    --index /projects/b1122/saya/scanmap_data \
    > bbcar/scanmap/results/results_regthres_clin_prs.txt
#

# Clinical + driver somatic 
python bbcar/scanmap/src/bbcar_run_scanmap.py \
    --genomic /projects/b1122/saya/scanmap_data/reg_thres.pik \
    --confound /projects/b1122/saya/scanmap_data/bbcar_clin_driversomatic_intindex.csv \
    --label /projects/b1122/saya/scanmap_data/bbcar_label_intindex.csv \
    --outdir /projects/b1042/ClareLab/saya/train_record/regthres_clin_driversomatic \
    --index /projects/b1122/saya/scanmap_data \
    --n_iter 4000 \
    > bbcar/scanmap/results/results_regthres_clin_driversomatic.txt
#

# Clinical + mutational signature + PRS
python bbcar/scanmap/src/bbcar_run_scanmap.py \
    --genomic /projects/b1122/saya/scanmap_data/reg_thres.pik \
    --confound /projects/b1122/saya/scanmap_data/bbcar_clin_mut_prs_intindex.csv \
    --label /projects/b1122/saya/scanmap_data/bbcar_label_intindex.csv \
    --outdir /projects/b1042/ClareLab/saya/train_record/regthres_clin_mut_prs \
    --index /projects/b1122/saya/scanmap_data \
    > bbcar/scanmap/results/results_regthres_clin_mut_prs.txt
#

# Clinical + mutational signature + driver somatic mutation
python bbcar/scanmap/src/bbcar_run_scanmap.py \
    --genomic /projects/b1122/saya/scanmap_data/reg_thres.pik \
    --confound /projects/b1122/saya/scanmap_data/bbcar_clin_mut_driversomatic_intindex.csv \
    --label /projects/b1122/saya/scanmap_data/bbcar_label_intindex.csv \
    --outdir /projects/b1042/ClareLab/saya/train_record/regthres_clin_mut_driversomatic \
    --index /projects/b1122/saya/scanmap_data \
    > bbcar/scanmap/results/results_regthres_clin_mut_driversomatic.txt
#

# Clinical + PRS + driver somatic mutation 
python bbcar/scanmap/src/bbcar_run_scanmap.py \
    --genomic /projects/b1122/saya/scanmap_data/reg_thres.pik \
    --confound /projects/b1122/saya/scanmap_data/bbcar_clin_prs_driversomatic_intindex.csv \
    --label /projects/b1122/saya/scanmap_data/bbcar_label_intindex.csv \
    --outdir /projects/b1042/ClareLab/saya/train_record/regthres_clin_prs \
    --index /projects/b1122/saya/scanmap_data \
    > bbcar/scanmap/results/results_regthres_clin_prs_driversomatic.txt
#
