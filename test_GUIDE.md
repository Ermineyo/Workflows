## GUIDE Test Report – Zhanye Zhang

## 遇到的问题/建议
1. 个人感觉，Docker 的语法比 Python 和 R 更复杂，坑也很多（如环境挂载、路径映射、root 权限问题等）。建议最终发布版本加入python包，方便用户个性化修改使用。  
2. 在 input data 需要放到固定名字的文件夹下（`omics`），个人感觉不够灵活，建议修改为可以输入任意文件路径可能好一些。  
3. 在 `docker run` 的参数中，用 1 表示 CPU、用 0 表示 GPU，指代不够直观，建议改成直接使用 `cpu` / `gpu`。  
4. 遇到问题，直接复制教程代码无法运行，建议把参数说明写到代码块外。  
   <img width="416" height="108" alt="image" src="https://github.com/user-attachments/assets/58241e76-64bd-49aa-aa82-185dbb4d7492" />  
5. 教程中的镜像名与实际下载的不一致。  
   <img width="416" height="66" alt="image" src="https://github.com/user-attachments/assets/5b641489-2ded-448f-bb1c-cc47755200df" />  
   解决办法：
   ```bash
   docker run --shm-size 12G \
     -v /Users/ermine/Downloads/test_GUIDE:/home/guide/data \
     wanglabhkust/guide:v0.1 \
     /home/guide/data \
     simple \
     1
   ```
6. 如果WSI patch 提取的步骤系统内存不够，会报错。
   遇到的error:
   ```bash
   (base) ➜  test_GUIDE docker run --shm-size 12G \
     -v /Users/ermine/Downloads/test_GUIDE:/home/guide/data \
     wanglabhkust/guide:v0.1 \
     /home/guide/data \
     simple \
     1
   Data path: /home/guide/data
   Output level: simple
   === Using Images ===
   === Device Check ===
   Force CPU mode (FORCE_CPU=1)
   Selected device: cpu
   Running in CPU mode
   WSI files path: /home/guide/data/wsi
   === Starting Image Preprocessing ===
   Found 2 files
   Number of processes: 2
   Number of training images: 2
   Task #1: Process slide 0
   Task #2: Process slide 1
   Opening Slide #0: /home/guide/data/wsi/CGGA_2103.svs
   Opening Slide #1: /home/guide/data/wsi/CGGA_P87.svs
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   Saving image to: /home/guide/data/mask/training_png/CGGA_P87.svs-32x-77400x56523-2418x1766.png
   Saving image to: /home/guide/data/mask/training_png/CGGA_2103.svs-32x-149504x94743-4672x2960.png
   Done converting slide 0
   Done converting slide 1
   Time elapsed: 0:00:06.713472
   Applying filters to images (multiprocess)
   
   Number of processes: 2
   Number of training images: 2
   Task #0: Process slide 0
   Task #1: Process slide 1
   Processing slide #0
   Processing slide #1
   RGB                  | Time: 0:00:00.119494  Type: uint8   Shape: (1766, 2418, 3)
   RGB                  | Time: 0:00:00.338706  Type: uint8   Shape: (2960, 4672, 3)
   Save Image           | Time: 0:00:00.745735  Name: /home/guide/data/mask/filter_png/CGGA_P87.svs-001-rgb.png
   Save Thumbnail       | Time: 0:00:00.018460  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_P87.svs-001-rgb.jpg
   Filter Green Channel | Time: 0:00:00.005227  Type: bool    Shape: (1766, 2418)
   Mask RGB             | Time: 0:00:00.007260  Type: uint8   Shape: (1766, 2418, 3)
   Save Image           | Time: 0:00:00.435603  Name: /home/guide/data/mask/filter_png/CGGA_P87.svs-002-rgb-not-green.png
   Save Thumbnail       | Time: 0:00:00.013609  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_P87.svs-002-rgb-not-green.jpg
   Filter Grays         | Time: 0:00:00.015255  Type: bool    Shape: (1766, 2418)
   Mask RGB             | Time: 0:00:00.006866  Type: uint8   Shape: (1766, 2418, 3)
   Save Image           | Time: 0:00:01.086588  Name: /home/guide/data/mask/filter_png/CGGA_2103.svs-001-rgb.png
   Save Thumbnail       | Time: 0:00:00.039645  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_2103.svs-001-rgb.jpg
   Filter Green Channel | Time: 0:00:00.015499  Type: bool    Shape: (2960, 4672)
   Mask RGB             | Time: 0:00:00.024039  Type: uint8   Shape: (2960, 4672, 3)
   Save Image           | Time: 0:00:00.431439  Name: /home/guide/data/mask/filter_png/CGGA_P87.svs-003-rgb-not-gray.png
   Save Thumbnail       | Time: 0:00:00.013329  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_P87.svs-003-rgb-not-gray.jpg
   Filter Red Pen       | Time: 0:00:00.062098  Type: bool    Shape: (1766, 2418)
   Mask RGB             | Time: 0:00:00.005904  Type: uint8   Shape: (1766, 2418, 3)
   Save Image           | Time: 0:00:00.774259  Name: /home/guide/data/mask/filter_png/CGGA_2103.svs-002-rgb-not-green.png
   Save Thumbnail       | Time: 0:00:00.035323  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_2103.svs-002-rgb-not-green.jpg
   Filter Grays         | Time: 0:00:00.038830  Type: bool    Shape: (2960, 4672)
   Mask RGB             | Time: 0:00:00.021228  Type: uint8   Shape: (2960, 4672, 3)
   Save Image           | Time: 0:00:00.747613  Name: /home/guide/data/mask/filter_png/CGGA_P87.svs-004-rgb-no-red-pen.png
   Save Thumbnail       | Time: 0:00:00.013289  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_P87.svs-004-rgb-no-red-pen.jpg
   Filter Green Pen     | Time: 0:00:00.107777  Type: bool    Shape: (1766, 2418)
   Mask RGB             | Time: 0:00:00.006320  Type: uint8   Shape: (1766, 2418, 3)
   Save Image           | Time: 0:00:00.772499  Name: /home/guide/data/mask/filter_png/CGGA_2103.svs-003-rgb-not-gray.png
   Save Thumbnail       | Time: 0:00:00.034742  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_2103.svs-003-rgb-not-gray.jpg
   Filter Red Pen       | Time: 0:00:00.210719  Type: bool    Shape: (2960, 4672)
   Mask RGB             | Time: 0:00:00.026616  Type: uint8   Shape: (2960, 4672, 3)
   Save Image           | Time: 0:00:00.756369  Name: /home/guide/data/mask/filter_png/CGGA_P87.svs-005-rgb-no-green-pen.png
   Save Thumbnail       | Time: 0:00:00.013520  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_P87.svs-005-rgb-no-green-pen.jpg
   Filter Blue Pen      | Time: 0:00:00.083332  Type: bool    Shape: (1766, 2418)
   Mask RGB             | Time: 0:00:00.005993  Type: uint8   Shape: (1766, 2418, 3)
   Save Image           | Time: 0:00:00.723152  Name: /home/guide/data/mask/filter_png/CGGA_P87.svs-006-rgb-no-blue-pen.png
   Save Thumbnail       | Time: 0:00:00.014376  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_P87.svs-006-rgb-no-blue-pen.jpg
   Mask RGB             | Time: 0:00:00.005852  Type: uint8   Shape: (1766, 2418, 3)
   Save Image           | Time: 0:00:01.030821  Name: /home/guide/data/mask/filter_png/CGGA_2103.svs-004-rgb-no-red-pen.png
   Save Thumbnail       | Time: 0:00:00.034633  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_2103.svs-004-rgb-no-red-pen.jpg
   Save Image           | Time: 0:00:00.430375  Name: /home/guide/data/mask/filter_png/CGGA_P87.svs-007-rgb-no-gray-no-green-no-pens.png
   Save Thumbnail       | Time: 0:00:00.013954  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_P87.svs-007-rgb-no-gray-no-green-no-pens.jpg
   Filter Green Pen     | Time: 0:00:00.349229  Type: bool    Shape: (2960, 4672)
   Remove Small Objs    | Time: 0:00:00.064905  Type: bool    Shape: (1766, 2418)
   Mask RGB             | Time: 0:00:00.008069  Type: uint8   Shape: (1766, 2418, 3)
   Mask RGB             | Time: 0:00:00.034820  Type: uint8   Shape: (2960, 4672, 3)
   Save Image           | Time: 0:00:00.418482  Name: /home/guide/data/mask/filter_png/CGGA_P87.svs-008-rgb-not-green-not-gray-no-pens-remove-small.png
   Save Thumbnail       | Time: 0:00:00.013294  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_P87.svs-008-rgb-not-green-not-gray-no-pens-remove-small.jpg
   Save Image           | Time: 0:00:00.408567  Name: /home/guide/data/mask/filter_png/CGGA_P87.svs-32x-77400x56523-2418x1766-filtered.png
   Save Thumbnail       | Time: 0:00:00.013905  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_P87.svs-32x-77400x56523-2418x1766-filtered.jpg
   Slide #001 processing time: 0:00:05.795919
   
   Save Image           | Time: 0:00:01.021804  Name: /home/guide/data/mask/filter_png/CGGA_2103.svs-005-rgb-no-green-pen.png
   Save Thumbnail       | Time: 0:00:00.033359  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_2103.svs-005-rgb-no-green-pen.jpg
   Filter Blue Pen      | Time: 0:00:00.265892  Type: bool    Shape: (2960, 4672)
   Mask RGB             | Time: 0:00:00.036471  Type: uint8   Shape: (2960, 4672, 3)
   Save Image           | Time: 0:00:00.991604  Name: /home/guide/data/mask/filter_png/CGGA_2103.svs-006-rgb-no-blue-pen.png
   Save Thumbnail       | Time: 0:00:00.034045  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_2103.svs-006-rgb-no-blue-pen.jpg
   Mask RGB             | Time: 0:00:00.034092  Type: uint8   Shape: (2960, 4672, 3)
   Save Image           | Time: 0:00:00.750085  Name: /home/guide/data/mask/filter_png/CGGA_2103.svs-007-rgb-no-gray-no-green-no-pens.png
   Save Thumbnail       | Time: 0:00:00.033530  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_2103.svs-007-rgb-no-gray-no-green-no-pens.jpg
   Remove Small Objs    | Time: 0:00:00.207226  Type: bool    Shape: (2960, 4672)
   Mask RGB             | Time: 0:00:00.020678  Type: uint8   Shape: (2960, 4672, 3)
   Save Image           | Time: 0:00:00.693705  Name: /home/guide/data/mask/filter_png/CGGA_2103.svs-008-rgb-not-green-not-gray-no-pens-remove-small.png
   Save Thumbnail       | Time: 0:00:00.034056  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_2103.svs-008-rgb-not-green-not-gray-no-pens-remove-small.jpg
   Save Image           | Time: 0:00:00.697446  Name: /home/guide/data/mask/filter_png/CGGA_2103.svs-32x-149504x94743-4672x2960-filtered.png
   Save Thumbnail       | Time: 0:00:00.034516  Name: /home/guide/data/mask/filter_thumbnail_jpg/CGGA_2103.svs-32x-149504x94743-4672x2960-filtered.jpg
   Slide #000 processing time: 0:00:09.926495
   
   Done filtering slide 0
   Done filtering slide 1
   Time to apply filters to all images (multiprocess): 0:00:09.954043
   
   Input path:  /home/guide/data/wsi
   Output path:  /home/guide/data/h5
   Number of processes: 2
   Number of training images: 2
   Task #0: Process slide 0
   Task #1: Process slide 1
     0%|          | 0/1 [00:00<?, ?it/s]Open CGGA_2103... Open CGGA_P87... Size  Size  945.96708965301511410.8173723220825
   
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFReadDirectoryCheckOrder: Warning, Invalid TIFF directory; tags are not sorted in ascending order.
   TIFFFetchNormalTag: Warning, ASCII value for tag "Artist" contains null byte in value; value incorrectly truncated during reading due to implementation limitations.
   JPEGFixupTagsSubsamplingSec: Warning, Auto-corrected former TIFF subsampling values [2,2] to match subsampling values inside JPEG compressed data [2,1].
   Downsampling with factor  0
   Given magnification 20.0, best level=0, best mag=40.0
   Opening image  2025-11-11 14:16:07.304844
     0%|          | 0/1 [00:00<?, ?it/s]
   Downsampling with factor  1
   Given magnification 20.0, best level=1, best mag=20.0
   Opening image  2025-11-11 14:16:07.477745
     0%|          | 0/1 [00:00<?, ?it/s]
   multiprocessing.pool.RemoteTraceback:
   """
   Traceback (most recent call last):
     File "/opt/conda/lib/python3.8/multiprocessing/pool.py", line 125, in worker
       result = (True, func(*args, **kwds))
     File "preprocess/preprocess_wsi_multi_process.py", line 110, in proces_batch
       valid_patches = extract_patches(image, extractor, mask_path, magnifications, patch_size, fp, args.out_path)
     File "preprocess/preprocess_wsi_multi_process.py", line 134, in extract_patches
       high_mag_img = get_image_at(image, magnifications[-1])
     File "/home/guide/preprocess/pre_wsi_pkg/patch_extractor.py", line 305, in get_image_at
       image_at = image.read_region(location=(0, 0),
     File "/opt/conda/lib/python3.8/site-packages/openslide/__init__.py", line 281, in read_region
       region = lowlevel.read_region(
     File "/opt/conda/lib/python3.8/site-packages/openslide/lowlevel.py", line 442, in read_region
       buf = (w * h * c_uint32)()
   MemoryError
   """
   
   The above exception was the direct cause of the following exception:
   
   Traceback (most recent call last):
     File "preprocess/preprocess_wsi_multi_process.py", line 183, in <module>
       run(out_path=args.out_path,
     File "preprocess/preprocess_wsi_multi_process.py", line 76, in run
       (start_ind, end_ind, file_paths_this) = result.get()
     File "/opt/conda/lib/python3.8/multiprocessing/pool.py", line 771, in get
       raise self._value
   MemoryError
   Error: preprocess_wsi_multi_process.py failed!
   ```
7. 如果open wsi的步骤内存不够，不会报错，但会卡死在```Opening image  2025-11-11 15:27:30.342442 ```，解决办法：修改docker memory limit(default=7.68G)。参考：一张片子（CGGA_P87.svs，～1G）,需要的内存峰值大概在33G左右。
   <img width="1280" height="726" alt="d62980f3ad846589183d6f98934da145_720" src="https://github.com/user-attachments/assets/29cf88ce-f053-4197-af9f-8540af4c31f8" />

8. 如果多次运行docker，但因为IO问题卡死，control C退出后docker不会退出，导致后台一直挂起占用资源，需要手动关掉。
   ```
   (base) ➜  test_GUIDE docker ps -a
   CONTAINER ID   IMAGE                     COMMAND                  CREATED         STATUS         PORTS     NAMES
   d6a56e9a75d0   wanglabhkust/guide:v0.1   "/bin/sh demo_docker…"   2 minutes ago   Up 2 minutes             compassionate_galileo
   8cc91de877bb   wanglabhkust/guide:v0.1   "/bin/sh demo_docker…"   5 minutes ago   Up 5 minutes             wonderful_gould
   70c0c47a6d85   wanglabhkust/guide:v0.1   "/bin/sh demo_docker…"   12 hours ago    Up 12 hours              priceless_goldwasser
   c74de41f5bf6   wanglabhkust/guide:v0.1   "/bin/sh demo_docker…"   12 hours ago    Up 12 hours              keen_hodgkin
   ```



### Supplementary Information
### Information of my MacOS desktop
<img width="560" height="1030" alt="image" src="https://github.com/user-attachments/assets/12276229-2425-4a31-8cc0-cd1ac6c66cbf" />

### File Path
```
.
├── omics/
│   ├── gene.csv
│   ├── methyl.csv
│   └── protein.csv
└── wsi/
    └── CGGA_P87.svs
```

### 运行结果
#### 1. only omics
##### 运行时间约5分钟以内，memory峰值不高，cpu峰值～1000%
##### result
| Sample ID | IME Score | Used Omics                 | IME Positive |
| --------- | --------- | -------------------------- | ------------ |
| CGGA_2103 | 0.3797    | gene, methylation, protein | False        |
| CGGA_P109 | 0.4478    | gene, protein              | False        |
| CGGA_P137 | 0.2461    | gene                       | False        |
| CGGA_P151 | 0.4099    | gene                       | False        |
| CGGA_P153 | 0.5767    | gene                       | True       |
| CGGA_P83  | 0.2139    | protein                    | False        |
| CGGA_P84  | 0.2458    | methylation, protein       | False        |
| CGGA_P87  | 0.3254    | methylation, protein       | False        |


#### 2. 一张片子(~1G)+omics
##### 运行时间约40分钟，memory峰值～32G，cpu峰值～1000%
##### code
```bash
docker run --shm-size=24g --memory=45g \
  -v /Users/zhanye/Downloads/test_GUIDE:/home/guide/data \
  wanglabhkust/guide:v0.1 \
  /home/guide/data simple 1
```
##### result
| Sample ID | IME Score | Used Omics                  | IME Positive |
| --------- | --------- | --------------------------- | ------------ |
| CGGA_2103 | 0.3797    | gene, methylation, protein  | False        |
| CGGA_P109 | 0.4478    | gene, protein               | False        |
| CGGA_P137 | 0.2461    | gene                        | False        |
| CGGA_P151 | 0.4099    | gene                        | False        |
| CGGA_P153 | 0.5767    | gene                        | True       |
| CGGA_P83  | 0.2139    | protein                     | False        |
| CGGA_P84  | 0.2458    | methylation, protein        | False        |
| CGGA_P87  | 0.3770    | image, methylation, protein | False        |

#### full report
```
(base) ➜  ~ docker run --shm-size=24g --memory=45g \
  -v /Users/zhanye/Downloads/test_GUIDE:/home/guide/data \
  wanglabhkust/guide:v0.1 \
  /home/guide/data simple 1
Data path: /home/guide/data
Output level: simple
=== Using Images ===
=== Device Check ===
Force CPU mode (FORCE_CPU=1)
Selected device: cpu
Running in CPU mode
WSI files path: /home/guide/data/wsi
=== Starting Image Preprocessing ===
Found 1 files
Number of processes: 1
Number of training images: 1
Task #1: Process slide 0
Opening Slide #0: /home/guide/data/wsi/CGGA_P87.svs
Saving image to: /home/guide/data/mask/training_png/CGGA_P87.svs-32x-77400x56523-2418x1766.png
Done converting slide 0
Time elapsed: 0:00:03.039338
Applying filters to images (multiprocess)

Number of processes: 1
Number of training images: 1
Task #0: Process slide 0
Processing slide #0
Done filtering slide 0
Time to apply filters to all images (multiprocess): 0:00:00.029219

Input path:  /home/guide/data/wsi
Output path:  /home/guide/data/h5
Number of processes: 1
Number of training images: 1
Task #0: Process slide 0
  0%|          | 0/1 [00:00<?, ?it/s]Open CGGA_P87... Size  945.9670896530151
Downsampling with factor  0
Given magnification 20.0, best level=0, best mag=40.0
Opening image  2025-11-12 03:56:07.302056
Finished reading image  2025-11-12 04:04:03.579448
Downsampling with factor 2
Finished reading high mag image
Small mask shape:  (1766, 2418)
High mag size:  (28416, 38912, 3)
Level dims:  ((77400, 56523), (19350, 14130), (4837, 3532), (2418, 1766))
Mask rate:  0.4777990524776743
Start extracting features  2025-11-12 04:07:28.150910
Finished extracting features  2025-11-12 04:07:33.277300
Start staining normalization
100%|██████████| 7729/7729 [00:35<00:00, 216.82it/s]
Start saving as .h5 files  2025-11-12 04:08:08.999170
(7729, 3, 256, 256)
Done
100%|██████████| 1/1 [17:55<00:00, 1075.79s/it]
Done converting slide 0
Done!
=== Complete Preprocessing Image ===
=== Starting Image Prediction ===
1
Downloading: "https://download.pytorch.org/models/resnet18-f37072fd.pth" to /root/.cache/torch/hub/checkpoints/resnet18-f37072fd.pth
100%|██████████| 44.7M/44.7M [00:02<00:00, 22.9MB/s]
  0%|          | 0/1 [00:00<?, ?it/s][2025-11-12 04:14:29,050] - [main_test_wsi_h5.py file line:55] - INFO: wsi_name: CGGA_P87.h5
[2025-11-12 04:21:26,500] - [trainer.py file line:27] - INFO: Current path: /home/guide
[2025-11-12 04:21:27,962] - [trainer.py file line:51] - INFO: # para: 11177538
[2025-11-12 04:21:27,963] - [trainer.py file line:87] - INFO: load_model_path: GUIDE/pretrained.pth
cpu
[2025-11-12 04:21:28,217] - [trainer.py file line:194] - INFO: Epoch 0 evaluation on test...
[2025-11-12 04:21:28,219] - [trainer.py file line:202] - INFO: Total number of batches: 31
31it [04:47,  9.28s/it]
[2025-11-12 04:26:18,628] - [trainer.py file line:220] - INFO: [1943] positive patches out of [7729]
100%|██████████| 1/1 [11:49<00:00, 709.62s/it]
=== Complete Image Prediction ===
=== Starting Multi-Omics Integration ===
           P_IDHm_IME                 used_omics  IME_positive
CGGA_2103    0.379725   gene,methylation,protein         False
CGGA_P109    0.447756               gene,protein         False
CGGA_P137    0.246127                       gene         False
CGGA_P151    0.409868                       gene         False
CGGA_P153    0.576733                       gene          True
CGGA_P83     0.213925                    protein         False
CGGA_P84     0.245784        methylation,protein         False
CGGA_P87     0.377047  image,methylation,protein         False

Results saved to: /home/guide/data/results/guide_results_simple.csv
=== Complete Multi-Omics Integration ===
=== Results saved to /home/guide/data/results/guide_results.csv ===
```



