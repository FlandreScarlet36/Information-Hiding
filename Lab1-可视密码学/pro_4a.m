clear all;%清空工作区变量

im_path_1="fig\rgb\3.bmp";
im_path_2="fig\rgb\4.bmp";
im_path_3="fig\rgb\5.bmp";

[A,M]=imread(im_path_1);
gray=rgb2gray(A);%三色图转化为灰度图
A_bw=im2bw(gray);%灰度图转化为二值图 binary image

[A1,M]=imread(im_path_2);
gray=rgb2gray(A1);%三色图转化为灰度图
A_bw1=im2bw(gray);%灰度图转化为二值图 binary image

[A2,M]=imread(im_path_3);
gray=rgb2gray(A2);%三色图转化为灰度图
A_bw2=im2bw(gray);%灰度图转化为二值图 binary image

[bw1,bw2,bw3,bw4]=divide_2(A_bw,A_bw1,A_bw2);



imwrite(A_bw,'fig\pro_4a\fig1.bmp');
imwrite(A_bw1,'fig\pro_4a\fig2.bmp');
imwrite(A_bw2,'fig\pro_4a\fig3.bmp');
imwrite(bw1,'fig\pro_4a\bw1.bmp');
imwrite(bw2,'fig\pro_4a\bw2.bmp');
imwrite(bw3,'fig\pro_4a\bw3.bmp');
imwrite(bw4,'fig\pro_4a\bw4.bmp');

