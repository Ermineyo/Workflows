getwd()
home <- "/home/rstudio-server"

output_file_folder <- paste0(home, "/target_average_depth")
input_file_folder <- "/mnt/project/Zhanye/extract_CNV_zongchao/Selected_bed"
sampleid_list <- readLines("/mnt/project/Zhanye/extract_CNV_zongchao/sample_ids.txt")

library("data.table")
library("reshape2")
# 创建输出目录（如果不存在）
dir.create(output_file_folder, showWarnings = FALSE, recursive = TRUE)

for (sampleid in sampleid_list) {
  querybed_file <- paste0(input_file_folder, "/", sampleid, ".per-base.query.bed")
  
  # 获取文件信息，判断文件是否为空
  file_info <- file.info(querybed_file)
  if (!is.na(file_info$size) && file_info$size > 0) {
    querybed <- fread(querybed_file)
    colnames(querybed) <- c("chr", "read_start", "read_end", "depth", "chrcp", "angilenV5_start", "angilenV5_end", "gene")
    
    querybed$readLength <- querybed$read_end - querybed$read_start
    querybed$AgilenLength <- querybed$angilenV5_end - querybed$angilenV5_start
    querybed$weightedDepth <- querybed$readLength * querybed$depth
    querybed$angilenV5_key <- paste(querybed$chrcp, querybed$angilenV5_start, querybed$angilenV5_end, querybed$gene, sep = "_")
    
    querybed_angilen <- querybed[!duplicated(querybed$angilenV5_key), ]
    
    agilengthSum <- reshape2::dcast(querybed_angilen, gene ~ ., value.var = "AgilenLength", sum)
    colnames(agilengthSum) <- c("gene", "TargetLength")
    geneDepthSum <- reshape2::dcast(querybed, gene ~ ., value.var = "weightedDepth", sum)
    colnames(geneDepthSum) <- c("gene", "weightedSumDepth")
    
    mergeDat <- merge(agilengthSum, geneDepthSum, by = "gene")
    mergeDat$TargetAverageDepth <- mergeDat$weightedSumDepth / mergeDat$TargetLength
    mergeDat$SampleID <- sampleid
    
    # 设置输出文件完整路径
    outfile <- file.path(output_file_folder, paste0(sampleid,".table.TargetAverageDepth", ".txt"))
    write.table(mergeDat, file = outfile, col.names = TRUE, row.names = FALSE, sep = "\t", quote = FALSE)
  } else {
    cat(paste(querybed_file, " file size zero\n"))
  }
}
