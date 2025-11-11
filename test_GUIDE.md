## GUIDE Test Report – Zhanye Zhang

## Suggestions
1. 个人感觉，Docker 的语法比 Python 和 R 更复杂，坑也很多（如环境挂载、路径映射、root权限问题等）。因此我个人建议可能采用在线分析网页 +  Python 包的形式会好一些，既方便使用又易于维护。
2.在input data需要放到固定名字的folder下（omics），不是很灵活，建议修改为可以输入任意文件路径。
3.docker run的参数中，用1表示cpu用0表示gpu，有点指代不明，建议可以直接改成cpu/gpu。
4.遇到问题，直接复制代码不能运行。建议把参数描述写到代码外。\
<img width="416" height="108" alt="image" src="https://github.com/user-attachments/assets/58241e76-64bd-49aa-aa82-185dbb4d7492" />
5.遇到问题，教程镜像名和下载下来的不一样。\
<img width="416" height="66" alt="image" src="https://github.com/user-attachments/assets/5b641489-2ded-448f-bb1c-cc47755200df" />
解决办法：修改为
```
docker run --shm-size 12G \
  -v /Users/ermine/Downloads/test_GUIDE:/home/guide/data \
  wanglabhkust/guide:v0.1 \
  /home/guide/data \
  simple \
  1
```
