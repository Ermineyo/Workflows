## GUIDE Test Report – Zhanye Zhang

## Suggestions
1. 个人感觉，Docker 的语法比 Python 和 R 更复杂，坑也很多（如环境挂载、路径映射、root 权限问题等）。因此我个人建议采用 **在线分析网页 + Python 包** 的形式会更好，既方便使用又易于维护。  
2. 在 input data 需要放到固定名字的文件夹下（`omics`），不够灵活，建议修改为可以输入任意文件路径。  
3. 在 `docker run` 的参数中，用 1 表示 CPU、用 0 表示 GPU，指代不够直观，建议改成直接使用 `cpu` / `gpu`。  
4. 遇到问题，直接复制教程代码无法运行，建议把参数说明写到代码块外。  
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
     1 ```
6. 如果系统内存不够，会报错。
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
7. Docker defau
8. 如果多次运行docker，但因为IO问题卡死，control C退出后docker不会退出，导致后台一直挂起占用资源
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
.
├── omics
│   ├── gene.csv
│   ├── methyl.csv
│   └── protein.csv
└── wsi
    └── CGGA_P87.svs


RAM:
Before: 
Running: 24.1G/48G

Slow step: Opening image  2025-11-11 14:59:38.474133
PID    COMMAND      %CPU TIME     #TH    #WQ  #PORTS MEM    PURG   CMPRS  PGRP  PPID  STATE    BOOSTS               %CPU_ME %CPU_OTHRS UID  FAULTS     COW       MSGSENT    MSGRECV     SYSBSD      SYSMACH
0      kernel_task  14.5 84:00:01 260/8  0    0      103M+  0B     0B     0     0     running   0[0]                0.00000 0.00000    0    117597     10660     2147483647 2147483647  0           0


