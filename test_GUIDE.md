## GUIDE Test Report – Zhanye Zhang

## Suggestions
1. 个人感觉，Docker 的语法比 Python 和 R 更复杂，坑也很多（如环境挂载、路径映射、root 权限问题等）。因此我个人建议采用 **在线分析网页 + Python 包** 的形式会更好，既方便使用又易于维护。  
2. 在 input data 需要放到固定名字的文件夹下（`omics`），不够灵活，建议修改为可以输入任意文件路径。  
3. 在 `docker run` 的参数中，用 1 表示 CPU、用 0 表示 GPU，指代不够直观，建议改成直接使用 `cpu` / `gpu`。  
4. 遇到问题时，直接复制教程代码无法运行，建议把参数说明写到代码块外。  
   <img width="416" height="108" alt="image" src="https://github.com/user-attachments/assets/58241e76-64bd-49aa-aa82-185dbb4d7492" />  
5. 教程中的镜像名与实际下载的不一致。  
   <img width="416" height="66" alt="image" src="https://github.com/user-attachments/assets/5b641489-2ded-448f-bb1c-cc47755200df" />  
   **解决办法：**
   ```bash
   docker run --shm-size 12G \
     -v /Users/ermine/Downloads/test_GUIDE:/home/guide/data \
     wanglabhkust/guide:v0.1 \
     /home/guide/data \
     simple \
     1
