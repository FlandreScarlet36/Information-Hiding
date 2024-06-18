clear all;%清空工作区变量

im_path_1="fig\rgb\4.bmp";

[A,M]=imread(im_path_1);
gray=rgb2gray(A);%三色图转化为灰度图

A_bw=halftone(gray);%灰度图经过半色调化处理转为二值图

[bw1,bw2,bw3,bw4]=divide_2_image(A_bw);

imwrite(gray,'fig\pro_2a\gray.bmp');
imwrite(A_bw,'fig\pro_2a\bw.bmp')
imwrite(bw1,'fig\pro_2a\bw1.bmp');
imwrite(bw2,'fig\pro_2a\bw2.bmp');
imwrite(bw3,'fig\pro_2a\bw3.bmp');
imwrite(bw4,'fig\pro_2a\bw4.bmp');