### pipline：variant calling
`fastq -> pvcf`

### 1. 双端测序 
bwa mem
_R1.fq.gz _R2.fq.gz -> bam

```
/home/zmoad/Software/miniconda3/install/bin/bwa mem -t 5 -M -R \
            "@RG\tID:1\tSM:${sample}\tLB:WES\tPL:Illumina" \
            /scratch/PI/jgwang/zmoad/Database/bwa/GRCh38.d1.vd1.fa \
                /scratch/PI/jgwang/zhanye/projects/Lung_Cancer_WGS/02.data/not_completed/*${sample}_1_R1.fq.gz \
                /scratch/PI/jgwang/zhanye/projects/Lung_Cancer_WGS/02.data/not_completed/*${sample}_1_R2.fq.gz| \
                /home/zmoad/Software/miniconda2/install/bin/samtools view \
            -Shb -o /scratch/PI/jgwang/zhanye/projects/Lung_Cancer_WGS/04.results/bysample/${sample}/${sample}.bam
```

### 2. 排序
samtools sort
bam -> .sort.bam

```
/home/zmoad/Software/miniconda2/install/bin/samtools sort /scratch/PI/jgwang/zhanye/projects/Lung_Cancer_WGS/04.results/bysample/${sample}/${sample}.bam \
        -o /scratch/PI/jgwang/zhanye/projects/Lung_Cancer_WGS/04.results/bysample/${sample}/${sample}.sort.bam -@ 5 && \
        rm /scratch/PI/jgwang/zhanye/projects/Lung_Cancer_WGS/04.results/bysample/${sample}/${sample}.bam
```

### 3. 排序后标index 
samtools index
.sort.bam -> .sort.bam

```
/home/zmoad/Software/miniconda2/install/bin/samtools index /scratch/PI/jgwang/zhanye/projects/Lung_Cancer_WGS/04.results/bysample/${sample}/${sample}.sort.bam
```

### 4. 标记重复
picard.jar MarkDuplicates
.sort.bam -> .sort.MD.bam

```
java -Djava.io.tmpdir=./ -Xmx10g -jar /scratch/PI/jgwang/zmoad/Software/picard/picard.jar MarkDuplicates \
    -INPUT /scratch/PI/jgwang/zhanye/projects/Lung_Cancer_WGS/04.results/bysample/${sample}/${sample}.sort.bam \
    -OUTPUT /scratch/PI/jgwang/zhanye/projects/Lung_Cancer_WGS/04.results/bysample/${sample}/${sample}.sort.MD.bam \
    -METRICS_FILE /scratch/PI/jgwang/zhanye/projects/Lung_Cancer_WGS/04.results/bysample/${sample}/${sample}.MD.txt \
    -ASSUME_SORTED true -VALIDATION_STRINGENCY LENIENT && \
    /home/zmoad/Software/miniconda2/install/bin/samtools index /scratch/PI/jgwang/zhanye/projects/Lung_Cancer_WGS/04.results/bysample/${sample}/${sample}.sort.MD.bam && \
    rm /scratch/PI/jgwang/zhanye/projects/Lung_Cancer_WGS/04.results/bysample/${sample}/${sample}.sort.bam
```

### 5. 单样本跟reference比，call出snp，bam->gvcf
gatk HaplotypeCaller
-R hg38chr/GRCh38.d1.vd1.fa -D assembly38.dbsnp138.vcf
.sort.MD.bam -> {chr1-Y}.gvcf.gz

```
/scratch/PI/jgwang/zmoad/Software/GATK4/gatk-4.1.9.0/gatk --java-options "-Xmx4g" HaplotypeCaller  \
-R /home/zmoad/database/hg38chr/GRCh38.d1.vd1.fa \
-D /scratch/PI/jgwang/zmoad/Database/GATK4/VariantRecalibrator/resources_broad_hg38_v0_Homo_sapiens_assembly38.dbsnp138.vcf \
-I $bam_dir/\${sample}.sort.MD.bam \
-O $out_dir/$sample/\${sample}.chr$chr.gvcf.gz \
-L chr$chr \
-A StrandOddsRatio \
-A Coverage \
-A QualByDepth \
-A FisherStrand \
-A MappingQualityRankSumTest \
-A ReadPosRankSumTest \
-A RMSMappingQuality \
-ERC GVCF \
```

### 6. 变成好处理的数据类型：GenomicsDB（慢）
gatk GenomicsDBImport
{all_sample}.{chr1-Y}.gvcf.gz -> {chr1-Y}.db

```
gvcf_list=\"\"

for sample in \`cut -f1 $dir/sample_name.txt\`
do
        gvcf_list=\"\$gvcf_list --variant $gvcf_dir/\${sample}/\${sample}.chr${chr}.gvcf.gz\"
done

/scratch/PI/jgwang/zhanye/softwares/GATK/gatk-4.1.9.0/gatk GenomicsDBImport --java-options "-Xmx100g" \
\$gvcf_list \
--genomicsdb-workspace-path $out_dir/chr${chr}.db \
-L chr$chr
```

### 7. 所有样本一起跟reference比，联合基因分型 (Joint Genotyping)，gvcf->pvcf
gatk GenotypeGVCFs
--reference GRCh38.d1.vd1.fa
{chr1-Y}.db -> {chr1-Y}.vcf.gz

```
/scratch/PI/jgwang/zhanye/softwares/GATK/gatk-4.1.9.0/gatk GenotypeGVCFs --java-options "-Xmx10g" \
--reference /home/zmoad/database/hg38chr/GRCh38.d1.vd1.fa \
--variant gendb://$comb_gvcf_dir/chr${chr}.db \
--annotation-group StandardAnnotation \
--allow-old-rms-mapping-quality-annotation-data \
--dbsnp /scratch/PI/jgwang/zmoad/Database/GATK4/VariantRecalibrator/resources_broad_hg38_v0_Homo_sapiens_assembly38.dbsnp138.vcf \
--output $out_dir/blood.germline.Lung_cancer.WGS.chr${chr}.vcf.gz \
-L chr$chr
```

### 8. 把所有的染色体merge成一个vcf
picard.jar MergeVcfs
{chr1-Y}.vcf.gz -> all.vcf.gz

```
vcf_list=""

for chr in X Y 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
        vcf_list="$vcf_list I=$vcf_dir/blood.wes.paired_glioma.chr${chr}.vcf.gz"
done

/home/zmoad/Software/miniconda3/install/bin/java -jar /scratch/PI/jgwang/zmoad/Software/picard/picard.jar MergeVcfs $vcf_list O=$out_dir/all.vcf.gz
```
