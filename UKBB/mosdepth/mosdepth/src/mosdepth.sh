#!/bin/bash
# mosdepth 0.0.1

main() {
    echo "Value of Bam_or_Cram_file: '$Bam_or_Cram_file'"
    echo "Value of Output_prefix: '$Output_prefix'"

    # Step 1: 下载 BAM/CRAM 文件（假设用户已上传 .bai/.crai）
    dx download "$Bam_or_Cram_file" -o input.bam_or_cram
    input_file="input.bam_or_cram"

    # Step 2: 构建 mosdepth 参数
    args=()

    [[ -n "$threads" ]] && args+=("-t" "$threads")
    [[ -n "$chrom" ]] && args+=("-c" "$chrom")
    [[ -n "$by" ]] && args+=("-b" "$by")
    [[ "$no_per_base" == "true" ]] && args+=("-n")
    [[ -n "$fasta" ]] && {
        dx download "$fasta" -o ref.fasta
        args+=("-f" "ref.fasta")
    }
    [[ -n "$flag" ]] && args+=("-F" "$flag")
    [[ -n "$include_flag" ]] && args+=("-i" "$include_flag")
    [[ "$fast_mode" == "true" ]] && args+=("-x")
    [[ "$fragment_mode" == "true" ]] && args+=("-a")
    [[ -n "$quantize" ]] && args+=("-q" "$quantize")
    [[ -n "$mapq" ]] && args+=("-Q" "$mapq")
    [[ -n "$min_frag_len" ]] && args+=("-l" "$min_frag_len")
    [[ -n "$max_frag_len" ]] && args+=("-u" "$max_frag_len")
    [[ -n "$thresholds" ]] && args+=("-T" "$thresholds")
    [[ "$use_median" == "true" ]] && args+=("-m")
    [[ -n "$read_groups" ]] && args+=("-R" "$read_groups")

    # 下载 CRAM index if provided
    if [[ -n "$cram_index" ]]; then
        dx download "$cram_index" -o input.bam_or_cram.crai
    fi

    # 下载 FASTA index if provided
    if [[ -n "$fasta_index" ]]; then
        dx download "$fasta_index" -o ref.fasta.fai
    fi
    
    # Step 3: 执行 mosdepth
    dx download "$mosdepth_binary" -o mosdepth
    chmod +x ./mosdepth
    ./mosdepth "${args[@]}" "$Output_prefix" "$input_file"

    # Step 4: 上传输出文件
    summary=$(dx upload "${Output_prefix}.mosdepth.summary.txt" --brief)
    global_dist=$(dx upload "${Output_prefix}.mosdepth.global.dist.txt" --brief)

    dx-jobutil-add-output out_mosdepth_summary_txt "$summary" --class=file
    dx-jobutil-add-output out_mosdepth_global_dist_txt "$global_dist" --class=file

    if [[ "$no_per_base" != "true" ]]; then
        if [[ -f "${Output_prefix}.per-base.bed.gz" ]]; then
            per_base=$(dx upload "${Output_prefix}.per-base.bed.gz" --brief)
            dx-jobutil-add-output out_per_base_bed_gz "$per_base" --class=file
        fi
        if [[ -f "${Output_prefix}.per-base.bed.gz.csi" ]]; then
            per_base_csi=$(dx upload "${Output_prefix}.per-base.bed.gz.csi" --brief)
            dx-jobutil-add-output out_per_base_bed_gz_csi "$per_base_csi" --class=file
        fi
    fi

    if [[ -f "${Output_prefix}.regions.bed.gz" ]]; then
        regions=$(dx upload "${Output_prefix}.regions.bed.gz" --brief)
        dx-jobutil-add-output out_regions_bed_gz "$regions" --class=file
    fi

    if [[ -f "${Output_prefix}.quantized.bed.gz" ]]; then
        quantized=$(dx upload "${Output_prefix}.quantized.bed.gz" --brief)
        dx-jobutil-add-output out_quantized_bed_gz "$quantized" --class=file
    fi

    if [[ -f "${Output_prefix}.thresholds.bed.gz" ]]; then
        thresholds_file=$(dx upload "${Output_prefix}.thresholds.bed.gz" --brief)
        dx-jobutil-add-output out_thresholds_bed_gz "$thresholds_file" --class=file
    fi
}