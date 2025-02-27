# VEP
## Goal
annotate gene function.
## Code
### Input
``
### Output
``
### Softwares
```
```
### Steps
#### 1.
```
source activate /home/zmoad/Software/miniconda3/install/envs/vep &&\

input_vcf="/scratch/PI/jgwang/zhanye/projects/2025Jan.HFS/de_novo_check/wang3_wang4.var.merged.vcf"
output_vcf="wang3_wang4.var.merged.vep.vcf"
ref_dir="/scratch/PI/jgwang/Yanbing/reference/VEP"


/home/zmoad/Software/miniconda3/install/envs/vep/bin/vep -i ${input_vcf} \
 -o ${output_vcf} --cache \
 --dir_cache /scratch/PI/jgwang/zmoad/Software/VEP/GRCh38 \
 --force_overwrite \
 --vcf \
 --plugin dbscSNV,$ref_dir/dbscSNV1.1_GRCh38.txt.gz \
 --plugin CADD,$ref_dir/whole_genome_SNVs.tsv.gz,$ref_dir/gnomad.genomes.r4.0.indel.tsv.gz \
 --plugin AlphaMissense,file=$ref_dir/AlphaMissense_hg38.tsv.gz,transcript_match=1 \
 --plugin satMutMPRA,file=$ref_dir/satMutMPRA_GRCh38_ALL.gz \
 --plugin SpliceRegion,Extended \
 --plugin TSSDistance \
 --plugin Frameshift \
 --plugin Wildtype \
 --plugin Downstream
```
### output example
