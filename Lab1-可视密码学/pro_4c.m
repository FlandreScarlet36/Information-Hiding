clear all;%清空工作区变量

im_path_1="fig\rgb\3.bmp";
im_path_2="fig\rgb\4.bmp";
im_path_3="fig\rgb\5.bmp";

[A,M]=imread(im_path_1);
[A1,M]=imread(im_path_2);
[A2,M]=imread(im_path_3);

asize = size(A);

A_bw=zeros(asize);
A_bw1=zeros(asize);
A_bw2=zeros(asize);

bw1=zeros(2*asize(1),2*asize(2),asize(3));
bw2=zeros(2*asize(1),2*asize(2),asize(3));
bw3=zeros(2*asize(1),2*asize(2),asize(3));
bw4=zeros(asize);

for i=1:3
    % 对三种像素分别进行半色调化处理
    A_bw(:,:,i)=halftone(A(:,:,i));
    A_bw1(:,:,i)=halftone(A1(:,:,i));
    A_bw2(:,:,i)=halftone(A2(:,:,i));

    % 对三种像素分别进行划分
    [bw1(:,:,i),bw2(:,:,i),bw3(:,:,i),bw4(:,:,i)]=divide_2(A_bw(:,:,i),A_bw1(:,:,i),A_bw2(:,:,i));
end


imwrite(A,'fig\pro_4c\rgb1.bmp')
imwrite(A1,'fig\pro_4c\rgb2.bmp')
imwrite(A2,'fig\pro_4c\rgb3.bmp')
imwrite(A_bw,'fig\pro_4c\fig1.bmp')
imwrite(A_bw1,'fig\pro_4c\fig2.bmp')
imwrite(A_bw2,'fig\pro_4c\fig3.bmp')
imwrite(bw1,'fig\pro_4c\bw1.bmp');
imwrite(bw2,'fig\pro_4c\bw2.bmp');
imwrite(bw3,'fig\pro_4c\bw3.bmp');
imwrite(bw4,'fig\pro_4c\bw4.bmp');