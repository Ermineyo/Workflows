### here is a quick code for merging *report.coding.PDFilter.txt files into one
```
#!/bin/bash

folder="./HFS13_2_423"
output="HFS13_2_423.report.coding.PDfilter.merge.txt"

# 找到所有匹配的文件
files=(${folder}/*/report/report.coding.PDfilter.txt)

# 处理合并，保留第一个文件的表头
awk '(NR==1) || (FNR>1)' "${files[@]}" > "$output"
```
