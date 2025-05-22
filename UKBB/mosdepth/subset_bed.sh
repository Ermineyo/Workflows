#!/bin/bash

ref_bed="/Zhanye/extract_CNV_zongchao/CCL_gene_region.bed"
bed_path="/Zhanye/extract_CNV_zongchao/mosdepth"

while read -r sampleid; do
    script="zcat ${sampleid}_23143_0_0.per-base.bed.gz | bedtools intersect -a - -b CCL_gene_region.bed -wb > ${sampleid}.per-base.query.bed"
    dx run swiss-army-knife -iin="${ref_bed}" \
        -iin="${bed_path}/${sampleid}_23143_0_0.per-base.bed.gz" \
        -iin="${bed_path}/${sampleid}_23143_0_0.per-base.bed.gz.csi" \
        -icmd="${script}" --tag="Bed Subset Case ${sampleid}" --instance-type "mem1_ssd1_v2_x2" \
        --destination="/Zhanye/extract_CNV_zongchao/Selected_bed/" --brief --yes
done < sample_ids.txt

