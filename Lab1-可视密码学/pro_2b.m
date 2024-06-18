clear all;%清空工作区变量

im_path_1="fig\rgb\4.bmp";

[A,M]=imread(im_path_1);

asize = size(A);

A_bw=zeros(asize);

bw1=zeros(2*asize(1),2*asize(2),asize(3));
bw2=zeros(2*asize(1),2*asize(2),asize(3));
bw3=zeros(2*asize(1),2*asize(2),asize(3));
bw4=zeros(asize);

for i=1:3
    % 对三种像素分别进行半色调化处理
    A_bw(:,:,i)=halftone(A(:,:,i));

    % 对三种像素分别进行划分
    [bw1(:,:,i),bw2(:,:,i),bw3(:,:,i),bw4(:,:,i)]=divide_2_image(A_bw(:,:,i));
end


imwrite(A,'fig\pro_2b\rgb.bmp')
imwrite(A_bw,'fig\pro_2b\bw.bmp')
imwrite(bw1,'fig\pro_2b\bw1.bmp');
imwrite(bw2,'fig\pro_2b\bw2.bmp');
imwrite(bw3,'fig\pro_2b\bw3.bmp');
imwrite(bw4,'fig\pro_2b\bw4.bmp');