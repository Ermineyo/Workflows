### This is a tutorial of using bulk RNA count result to get immune infiltration status.
1. Got count file from fastq using fastp + STAR + featurecount.
2. Nomalization count file to TPM and transfer to gene SYMBOL.
   ```
   count2logTPM <- function(sample_list,input_path,output_file){
      library(data.table)
      library(dplyr)
      library(tidyverse)
      library(biomaRt)
      
      # Step 1: 读取样本列表，合并所有 featureCounts 表达矩阵
      sample_list <- sample_list
      file <- paste0(input_path,'/', sample_list[1], '.gene_counts.txt')
      count_all <- as.data.frame(fread(file))
      colnames(count_all)[7] <- sample_list[1]
      cols <- colnames(count_all[1:6])
      
      for (sample in sample_list[2:length(sample_list)]) {
        file <- paste0(input_path,'/', sample, '.gene_counts.txt')
        this_count <- as.data.frame(fread(file))
        colnames(this_count)[7] <- sample
        count_all <- merge(count_all, this_count, by = cols, all = TRUE)
      }
      
      # Step 2: 提取长度信息，准备 raw count 矩阵
      gene_lengths <- count_all[, c("Geneid", "Length")]
      gene_lengths$Length <- as.numeric(gene_lengths$Length)
      length_kb <- gene_lengths$Length / 1000
      
      expr_matrix <- count_all[, -(1:6)]
      expr_matrix <- as.data.frame(sapply(expr_matrix, as.numeric))  # 保证是 numeric 类型
      
      # Step 3: TPM 计算函数
      calcTPM <- function(counts, gene_length_kb) {
        rpk <- counts / gene_length_kb
        scaling_factor <- sum(rpk) / 1e6
        tpm <- rpk / scaling_factor
        return(tpm)
      }
      
      # Step 4: 计算 TPM
      tpm_matrix <- apply(expr_matrix, 2, function(x) calcTPM(x, length_kb))
      tpm_matrix <- as.data.frame(tpm_matrix)
      
      # Step 5: 添加 Ensembl ID（去掉版本号）
      tpm_matrix$ensembl_gene_id <- gsub("\\..*$", "", count_all$Geneid)
      
      # Step 6: 转换 Ensembl ID → Symbol（biomaRt）
      mart <- useEnsembl(biomart = "genes", dataset = "hsapiens_gene_ensembl", mirror = "asia")
      conversion <- getBM(attributes = c("ensembl_gene_id", "hgnc_symbol"),
                          filters = "ensembl_gene_id",
                          values = tpm_matrix$ensembl_gene_id,
                          mart = mart)
      
      # 去除重复 Ensembl ID
      conversion_unique <- conversion %>%
        distinct(ensembl_gene_id, .keep_all = TRUE)
      
      # Step 7: 合并并转换为 Symbol × Sample 矩阵
      tpm_with_symbol <- left_join(tpm_matrix, conversion_unique, by = "ensembl_gene_id") %>%
        filter(hgnc_symbol != "") %>%
        dplyr::select(-ensembl_gene_id) %>%
        group_by(hgnc_symbol) %>%
        summarize(across(everything(), sum)) %>%
        ungroup()
      
      # Step 8: 设置 Symbol 为行名，去掉 symbol 列
      tpm_matrix_symbol <- as.data.frame(tpm_with_symbol)
      rownames(tpm_matrix_symbol) <- tpm_matrix_symbol$hgnc_symbol
      tpm_matrix_symbol$hgnc_symbol <- NULL
      
      # ✅ Step 8.1: log2(TPM + 1) 转换
      log2_tpm_matrix <- log2(tpm_matrix_symbol + 1)
      
      # Step 9: 写出为 CIBERSORTx 输入文件（行名 = symbol，列 = 样本）
      write.table(log2_tpm_matrix,
                  file = output_file,
                  sep = "\t", quote = FALSE, row.names = TRUE, col.names = NA)
    }
   ```
