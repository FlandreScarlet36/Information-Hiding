clear all;%清空工作区变量

im_path_1="fig\rgb\2.bmp";

[A,M]=imread(im_path_1);
gray=rgb2gray(A);%三色图转化为灰度图
A_bw=im2bw(gray);%灰度图转化为二值图 binary image

[bw1,bw2,bw3,bw4]=divide_2_image(A_bw);

imwrite(A_bw,'fig\pro_1\bw.bmp');
imwrite(bw1,'fig\pro_1\bw1.bmp');
imwrite(bw2,'fig\pro_1\bw2.bmp');
imwrite(bw3,'fig\pro_1\bw3.bmp');
imwrite(bw4,'fig\pro_1\bw4.bmp');