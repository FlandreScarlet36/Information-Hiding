% 进行半色调化处理
function [im_bw]=halftone(im_gray)
% im:彩色图片
% im_gray:灰度图片
% im_bw:半色调图片

% 读入原始图像并转换为灰度图像
% im = imread(im_path);
% im_gray = rgb2gray(im);

% 初始化输出图像和误差矩阵
im_bw = im_gray;

x=size(im_bw, 1);
y=size(im_bw, 2);
% 执行误差扩散算法
for i = 1:x
    for j = 1:y
        if im_bw(i,j)>127
            out=255;
        else
            out=0;
        end
        error=im_bw(i,j)-out;
        if j>1 && i<x && j<y
            im_bw(i,j+1)=im_bw(i,j+1)+error*7/16.0;%右方
            im_bw(i+1,j)=im_bw(i+1,j)+error*5/16.0;%下方
            im_bw(i+1,j-1)=im_bw(i+1,j-1)+error*3/16.0;%左下方
            im_bw(i+1,j+1)=im_bw(i+1,j+1)+error*1/16.0;%右下方
            im_bw(i,j)=out;
        else
            im_bw(i,j)=out;
    end
end

end
