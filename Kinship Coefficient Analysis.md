# Kinship Coefficient Analysis

## Goal
Calculate Kinship Coefficient value to check kinship between samples.

### Input:`Bam`
### Output:`Kinship Coefficient Matrix`
### softwares
```
bcftools 1.21
samtools 1.3.1
PLINK v2.00a5.12LM 64-bit Intel (25 Jun 2024)
“`
### steps
####1.1 Create a script to make script that can transfer .bam to .vcf.
```
#!/bin/bash

# Clear the output script file to avoid duplicates
> 01.1.Wang.getVCF.sh

# Loop through each entry in bam_index.txt
while read -r i; do
    # Append commands to the script file
    echo "samtools mpileup -ugf GRCh38.d1.vd1.fa -l SNP_GRCh38_hg38_wChr.bed Wang_${i}.sort.MD.bam | bcftools call -A -c -o Wang_${i}.vcf &" >> 01.1.Wang.getVCF.sh
    echo "bgzip -c Wang_${i}.vcf > Wang_${i}.vcf.gz" >> 01.1.Wang.getVCF.sh
    echo "tabix -p vcf Wang_${i}.vcf.gz" >> 01.1.Wang.getVCF.sh
done < bam_index.txt
```
####1.2 Transfer .bam to indexed .vcf.gz file.
```
#!/bin/bash

#SBATCH -p amd --priority=Top# himem-share
#SBATCH -N 1
#SBATCH -n 20
#SBATCH --gres-flags=enforce-binding
#SBATCH -J TT1 #Slurm job name
#SBATCH --mail-user=zhanyezhang@ust.hk #Update your email address
#SBATCH --mail-type=begin
#SBATCH --mail-type=end

samtools mpileup -ugf GRCh38.d1.vd1.fa -l SNP_GRCh38_hg38_wChr.bed Wang_1.sort.MD.bam | bcftools call -A -c -o Wang_1.vcf &
bgzip -c Wang_1.vcf > Wang_1.vcf.gz
tabix -p vcf Wang_1.vcf.gz
```
####2. Merge all the .vcf files with bcftools merge.
```
bcftools merge Wang_1.vcf.gz Wang_2.vcf.gz Wang_3.vcf.gz Wang_4.vcf.gz Wang_5.vcf.gz Wang_6.vcf.gz -o merged.vcf.gz -Oz
```
####3. Transfer merged .vcf file into plink2 --bpgen file format. Only use autosomes.
```
plink2 --vcf merged.vcf.gz --make-bpgen --out Wang --allow-extra-chr --chr 1-22 --max-alleles 2
```
####4. Caculate kinship coefficient value with plink2.
```
plink2 --bpfile Wang --maf 0.05 --make-king-table --out Kinship
```

### output example
```
#FID1    IID1    FID2    IID2    NSNP    HETHET    IBS0    KINSHIP
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_2.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_1.sort.MD.bam    10169    0.262759    0.117219    0.0228907
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_3.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_1.sort.MD.bam    10170    0.319862    0.0093412    0.259904
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_3.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_2.sort.MD.bam    10181    0.309695    0.00746489    0.254604
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_4.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_1.sort.MD.bam    10157    0.316334    0.00964852    0.257171
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_4.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_2.sort.MD.bam    10165    0.305558    0.006788    0.25294
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_4.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_3.sort.MD.bam    10168    0.370181    0.0338316    0.260771
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_5.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_1.sort.MD.bam    10178    0.324622    0.00776184    0.267575
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_5.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_2.sort.MD.bam    10175    0.303391    0.0101229    0.244475
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_5.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_3.sort.MD.bam    10177    0.391569    0.0350791    0.277301
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_5.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_4.sort.MD.bam    10164    0.383314    0.0287288    0.281553
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_6.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_1.sort.MD.bam    10174    0.32013    0.00727344    0.265671
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_6.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_2.sort.MD.bam    10171    0.302625    0.00865205    0.247676
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_6.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_3.sort.MD.bam    10172    0.373869    0.0358828    0.260541
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_6.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_4.sort.MD.bam    10160    0.385728    0.0271654    0.286879
0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_6.sort.MD.bam    0    /home/ybwang/myfolder/2024Dec.HFS/bwa/Wang_5.sort.MD.bam    10176    0.375884    0.0300708    0.273007
```

### R script for figure drawing.
```
library(igraph)

# 读取数据
kinship_data <- "
Wang_2    Wang_1    0.0228907
Wang_3    Wang_1    0.259904
Wang_3    Wang_2    0.254604
Wang_4    Wang_1    0.257171
Wang_4    Wang_2    0.25294
Wang_4    Wang_3    0.260771
Wang_5    Wang_1    0.267575
Wang_5    Wang_2    0.244475
Wang_5    Wang_3    0.277301
Wang_5    Wang_4    0.281553
Wang_6    Wang_1    0.265671
Wang_6    Wang_2    0.247676
Wang_6    Wang_3    0.260541
Wang_6    Wang_4    0.286879
Wang_6    Wang_5    0.273007
"

# 转换为数据框
kinship_df <- read.table(text = kinship_data, header = FALSE, col.names = c("IID1", "IID2", "KINSHIP"))

# 创建图
g <- graph_from_data_frame(kinship_df, directed = FALSE)

# 设置边的权重
E(g)$width <- kinship_df$KINSHIP * 10  # 调整边的粗细以突出权重

# 画图
plot(
  g, 
  vertex.size = 20, 
  vertex.label.cex = 1.2, 
  edge.width = E(g)$width, 
  edge.label = round(E(g)$width / 10, 3),
  edge.label.cex = 0.8,
  main = "Kinship Family Tree"
)
```










