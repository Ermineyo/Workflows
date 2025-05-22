### 介绍
1. mosdepth 包含可以直接上传的UKB app
2. mosdepth.sh: 用上传的app，根据eid_list找目标区域CNV（by 位点）
3. subset.sh: 从mosdepth.sh结果，根据bed，subset出想要的区域
4. get_target_average_depth.R: 从subset.sh结果，by gene计算出average_depth
