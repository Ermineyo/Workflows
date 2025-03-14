### draw PCA plot with some highlighted samples, data from UKB field.

```
setwd("/Users/zhanye/Documents/projects/UK_biobank/PCA")

# 加载必要的库
library(data.table)
library(umap)
library(dplyr)

# 读取数据
file_path <- "data_participant.csv"
pc <- read.csv(file_path, header = TRUE)  # len=502148
file_21_sample_path <- "Participant_table.csv"
samples_21 <- read.csv(file_21_sample_path, header = TRUE)

# 数据预处理：删除缺失值
pc_noNA <- pc %>% filter(complete.cases(pc[, 1:41]))

# 检查 samples_21 中存在的 eid
sample_list_21_exist <- intersect(samples_21$Participant.ID, pc_noNA$eid)

# 为存在的样本设置不同的点形状
pc_noNA <- pc_noNA %>%
  mutate(pch = ifelse(eid %in% sample_list_21_exist, 19, 4))

# 获取种族信息
ethnicity <- pc_noNA$p21000_i0

ethnicity_list <- c("British", "Irish", "White", "Any other white background",
                    "Pakistani", "Bangladeshi", "Indian", "Any other Asian background", "Chinese", "Asian or Asian British",
                    "African", "Caribbean", "Black or Black British", "Any other Black background",
                    "White and Asian", "White and Black African", "White and Black Caribbean", "Any other mixed background", "Mixed",
                    "Other ethnic group", "Prefer not to answer", "Do not know")

color_list <- c("#1E90FF", "#4682B4", "#6495ED", "#87CEFA",  # 白人组 - 深浅蓝色
                "#FFA500", "#FF8C00", "#FF4500", "#FFD700", "#FF6347", "#FF7F50",  # 亚洲组 - 橙红黄系
                "#228B22", "#006400", "#2E8B57", "#556B2F",  # 黑人组 - 深绿墨绿
                "#9370DB", "#DDA0DD", "#BA55D3", "#FF00FF", "#8A2BE2",  # 混合组 - 紫粉青色
                "#808080", "#A9A9A9", "#000000")  # 其他 - 灰色黑色


# 给每个类别赋颜色
ethnicity_colors <- adjustcolor(color_list[match(pc_noNA$p21000_i0, ethnicity_list)], alpha.f = 0.3)

# 定义图例的颜色与标签
legend_colors <- color_list
legend_labels <- ethnicity_list

# 创建输出文件
bmp("PC1_vs_PC2.bmp", width=3200, height=2400, res=300)
par(mar = c(5, 5, 4, 16))  # 右边距调整

# 设置PC1和PC2数据
pc1_index <- 2
pc2_index <- 3
PC1 <- pc_noNA[, pc1_index]
PC2 <- pc_noNA[, pc2_index]

# 绘制散点图
plot(PC1, PC2,
     xlim = c(min(PC1)-0.01, max(PC1)+0.01),
     ylim = c(min(PC2)-0.01, max(PC2)+0.01),
     col = ethnicity_colors,
     xlab = 'PC1', ylab = 'PC2',
     pch = pc_noNA$pch)

# 高亮指定的样本
highlighted_colors <- rep("#B22222", length(sample_list_21_exist))  # 深红色
points(PC1[pc_noNA$eid %in% sample_list_21_exist], 
       PC2[pc_noNA$eid %in% sample_list_21_exist], 
       pch = 19, col = highlighted_colors)

# 添加图例
legend('topright', 
       legend = legend_labels, 
       col = legend_colors, 
       pch = 19, 
       cex = 1.2, 
       xpd = TRUE,  # 确保图例显示在图外
       inset = c(-0.47, 0))  # 调整图例位置到图外右边

dev.off()


```
