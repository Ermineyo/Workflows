#### 1. get file real paths under folder into txt file.
`find "$(realpath ./)" -type f > /scratch/PI/jgwang/zhanye/projects/Cello2_upgrade/CheckMate/NGScheckmate/vcf.list`

#### 2. vcf to txt
```
#!/bin/bash

input_vcf="input.vcf"
output_txt="output.txt"

echo -e "CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tAllele\tConsequence\tIMPACT\tSYMBOL\tGene\tFeature_type\tFeature\tBIOTYPE\tEXON\tINTRON\tHGVSc\tHGVSp\tcDNA_position\tCDS_position\tProtein_position\tAmino_acids\tCodons\tExisting_variation\tDISTANCE\tSTRAND\tFLAGS\tSYMBOL_SOURCE\tHGNC_ID\tCADD_PHRED\tCADD_RAW\tSpliceRegion\tTSSDistance\tFrameshiftSequence\tWildtypeProtein\tDownstreamProtein\tProteinLengthChange" > "$output_txt"

# 解析 VCF 文件
awk -F'\t' '{
    if ($1 ~ /^#/) next;  # 跳过 VCF 头部注释
    split($8, info, "CSQ=");  # 按 "CSQ=" 分割 INFO 字段
    if (length(info) > 1) {
        split(info[2], csq_fields, "|");  # 按 | 分割 CSQ 注释
        print $1, $2, $3, $4, $5, $6, $7, csq_fields[1], csq_fields[2], csq_fields[3], csq_fields[4], csq_fields[5], csq_fields[6], csq_fields[7], csq_fields[8], csq_fields[9], csq_fields[10], csq_fields[11], csq_fields[12], csq_fields[13], csq_fields[14], csq_fields[15], csq_fields[16], csq_fields[17], csq_fields[18], csq_fields[19], csq_fields[20], csq_fields[21], csq_fields[22], csq_fields[23], csq_fields[24], csq_fields[25], csq_fields[26], csq_fields[27], csq_fields[28], csq_fields[29] >> "'$output_txt'"
    }
}' OFS='\t' "$input_vcf"
```

#### 3.soft link
`ln -s /home/ybwang/myfolder/2024Dec.HFS/GATK/out.GRCh38.3/HFS.WES.chr1.vcf.gz ./HFS.WES.chr1.vcf.gz`
