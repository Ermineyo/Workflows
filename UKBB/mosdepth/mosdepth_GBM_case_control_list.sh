#!/bin/bash

# 设置 applet ID 和参考路径
app_id="applet-J0XqxP0J5Fp71Qvpz9FF6Qpq"
mosdepth_bin="/Zhanye/mosdepth_test/mosdepth"
fasta="/Bulk/Exome sequences/Exome OQFE CRAM files/helper_files/GRCh38_full_analysis_set_plus_decoy_hla.fa"
fai="/Bulk/Exome sequences/Exome OQFE CRAM files/helper_files/GRCh38_full_analysis_set_plus_decoy_hla.fa.fai"
output_path="/Zhanye/extract_CNV_zongchao/mosdepth/"


# 逐行读取 GBM_case_control_list.txt
while read -r id; do
  prefix="${id}_23143_0_0"
  dir="/Bulk/Exome sequences/Exome OQFE CRAM files/${id:0:2}"
  cram="${dir}/${prefix}.cram"
  crai="${dir}/${prefix}.cram.crai"

  echo "Submitting job for ID: $id"

  dx run "$app_id" \
    -imosdepth_binary="$mosdepth_bin" \
    -iBam_or_Cram_file="$cram" \
    -icram_index="$crai" \
    -ifasta="$fasta" \
    -ifasta_index="$fai" \
    -iOutput_prefix="$prefix" \
    -ithreads=8 \
    -imapq=10 \
    -ifast_mode=true \
    --brief --yes \
    --destination="$output_path"

done < GBM_case_control_list.txt
