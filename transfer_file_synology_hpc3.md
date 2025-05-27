### This is a stable approach to transfer file from Synology to HPC3, through local Mac, using rsync.
1. Create socket file using```ssh -M -S ~/.ssh/cm-zhanyezhang@hpc3.ust.hk:22 zhanyezhang@hpc3.ust.hk```
2. Open another terminal window, but do not closed the current one.
3. In another terminal:
   ```
   file_list="dna_bam_list.txt"
   
    while read file; do
      if [[ -f "$file" ]]; then
        rsync -avL --progress -e "ssh -S ~/.ssh/cm-zhanyezhang@hpc3.ust.hk:22" "$file" zhanyezhang@hpc3.ust.hk:/scratch/PI/jgwang/zhanye/projects/xxx/xxx/bam/
      else
        echo "File not found: $file"
      fi
    done < "$file_list"

   ```
   dna_bam_list.txt contains Synology file path, like ```/Volumes/qmu/NG2016/rGBM_DNA/R043.DNA.0.bam```
