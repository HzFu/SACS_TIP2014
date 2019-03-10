The Matlab code for Self-adaptively Weighted Co-saliency (SACS) Detection
 

--------------------------------------------------------------------------------

Please cite the following publication if you used or was inspired by this code/work:
 

1. Xiaochun Cao, Zhiqiang Tao, Bao Zhang, Huazhu Fu, Wei Feng, "Self-adaptively Weighted Co-saliency Detection via Rank Constraint", 
IEEE Transactions on Image Processing (T-IP), vol. 23, no. 9, pp. 4175-4186, 2014.

2. Xiaochun Cao, Zhiqiang Tao, Bao Zhang, Huazhu Fu, Xuewei Li, "Saliency map fusion based on rank-one constraint",
in IEEE International Conference on Multimedia & Expo (ICME), 2013, pp. 1-6. 

--------------------------------------------------------------------------------

This code is a primitive MATLAB code, which is simpler than that we used in the paper.

If you find any bugs, please contact Zhiqiang Tao (zqtaomail@gmail.com).
 

--------------------------------------------------------------------------------

Demo:

1.demo_mul.m: In this demo, we fuse five methods, which are MR (_stage2.png), HS (_res.png), 
RC (_RC.png), SP (_SP.png) and CO (_CO.png), for detecting co-saliency in a group of 
13 images from iCoseg dataset.

2.demo_pair.m: In this demo, we fuse seven methods, which are MR (_stage2.png), HS (_res.png), 
RC (_RC.png), HC (_HC.png), CC(_CC.png), CP(_CP.png) and SP (_SP.png), for detecting co-saliency in a
pair of images from ImagePair dataset.

3.demo_single.m: In this demo, we provide four single salieny dectetion examples, where each is obtaind by
fusing six methods: MR (_stage2.png), HS (_res.png), RC (_RC.png), HC (_HC.png), LR(_LR.png) and GB(_GB.png).
These four images are from MSRB-B dataset.
--------------------------------------------------------------------------------

We examplify demo_mul.m to show how to use this code:

1. Put a set of images in the folder 'images/multiple' for co-saliency detection.

2. Generate the maps of various methods for the input images, and put the results in the folder 'submaps/multiple'. 
Please note that, these results should be named as 'img_name + method_name', e.g., 'Christ_1_CO.png'.

3. Run demo_mul.m for raw results.

4. Run reassign.m for the refined results.



----------------------------------------------------------------------------------
The elementary saliency methods below are uesd in our framework:

1. For multipe images co-saliency dection on iCoseg dataset:
MR (_stage2.png), HS (_res.png), RC (_RC.png), SP (_SP.png) and CO (_CO.png).
2. For image pair co-saliency dection on image pair dataset:
MR (_stage2.png), HS (_res.png), RC (_RC.png), HC (_HC.png), SP (_SP.png), CC (_CC.png),
CP (_CP.png), and SP (_SP.png).
3. For single image saliency dection on MSRA-B dataset:
MR (_stage2.png), HS (_res.png), LR (_LR.png), RC (_RC.png), HC (_HC.png) and GB (_GB.png).

More details can be found in our paper, and you can find the codes or the results of the methods above 
form the addresses listed below:

MR: C. Yang, L. Zhang, H. Lu, X. Ruan, and M.-H. Yang, "Saliency detection via graph-based manifold ranking," 
in CVPR, 2013, pp. 3166-3173. 

HS: Q. Yan, L. Xu, J. Shi, and J. Jia, "Hierarchical saliency detection," in CVPR, 
2013, pp. 1155-1162. 

RC,HC: M. Cheng, G. Zhang, N. J. Mitra, X. Huang, and S. Hu, "Global contrast based salient region detection," 
in CVPR, 2011, pp. 409-416. 

SP,CO: H. Fu, X. Cao, and Z. Tu, "Cluster-based co-saliency detection," IEEE
Trans. Image Process., vol. 22, no. 10, pp. 3766-3778 

CC,CP: H. Li and K. Ngan, "A co-saliency model of image pairs," IEEE Trans.Image Process., 
vol. 20, no. 12, pp. 3365-3375, 2011. 

LR: X. Shen and Y. Wu, "A unified approach to salient object detection via
low rank matrix recovery," in CVPR, 2012, pp. 853-860. 

GB: J. Harel, C. Koch, and P. Perona, "Graph-based visual saliency," in NIPS.
MIT Press, 2007, pp. 545-552. 

Please also cited these works if you use their results or codes.
