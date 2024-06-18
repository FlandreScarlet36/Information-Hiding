clear all;%清空工作区变量

im_path_1="fig\rgb\3.bmp";
im_path_2="fig\rgb\4.bmp";
im_path_3="fig\rgb\5.bmp";

[A,M]=imread(im_path_1);
gray=rgb2gray(A);%三色图转化为灰度图

[A1,M]=imread(im_path_2);
gray1=rgb2gray(A1);%三色图转化为灰度图

[A2,M]=imread(im_path_3);
gray2=rgb2gray(A2);%三色图转化为灰度图

A_bw=halftone(gray);%灰度图经过半色调化处理转为二值图
A_bw1=halftone(gray1);%灰度图经过半色调化处理转为二值图
A_bw2=halftone(gray2);%灰度图经过半色调化处理转为二值图


[bw1,bw2,bw3,bw4]=divide_2(A_bw,A_bw1,A_bw2);


imwrite(gray,'fig\pro_4b\gray1.bmp');
imwrite(gray1,'fig\pro_4b\gray2.bmp');
imwrite(gray2,'fig\pro_4b\gray3.bmp');
imwrite(A_bw,'fig\pro_4b\fig1.bmp');
imwrite(A_bw1,'fig\pro_4b\fig2.bmp');
imwrite(A_bw2,'fig\pro_4b\fig3.bmp');
imwrite(bw1,'fig\pro_4b\bw1.bmp');
imwrite(bw2,'fig\pro_4b\bw2.bmp');
imwrite(bw3,'fig\pro_4b\bw3.bmp');
imwrite(bw4,'fig\pro_4b\bw4.bmp');

