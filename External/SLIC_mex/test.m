%
img = imread('test.jpg');
superpixels= SLIC_mex( img, 200, 20 );
imshow(superpixels,[]);