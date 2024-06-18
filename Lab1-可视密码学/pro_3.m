clear all;%清空工作区变量

im_path_1="fig\rgb\2.bmp";

[A,M]=imread(im_path_1);
gray=rgb2gray(A);%三色图转化为灰度图
A_bw=im2bw(gray);%灰度图转化为二值图 binary image

