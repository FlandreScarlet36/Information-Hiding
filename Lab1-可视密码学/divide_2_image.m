% 将二值图像划分为两个图片
% A_bw: 需要操作的二值图像
% bw1: 图像1
% bw2: 图像2
% bw3: 用图像1和图像2叠加进行恢复
% bw4: 将bw3恢复成原图
function [bw1,bw2,bw3,bw4]=divide_image(A_bw)
x=size(A_bw, 1);
y=size(A_bw, 2);

bw1 = zeros(2*x,2*y);
bw2 = zeros(2*x,2*y);

% bw3和bw4存储恢复的图像
bw3 = zeros(2*x,2*y);
bw4 = zeros(x,y);

for i = 1:x
    for j = 1:y
        a=2*i-1;
        b=2*j-1;
        rand_i=randi([1,3]);
        switch rand_i
            case 1
                %子图1
                bw1(a+1,b)=255;
                bw1(a+1,b+1)=255;
                %子图2
                if A_bw(i,j) == 0%黑色
                    bw2(a,b)=255;
                    bw2(a,b+1)=255;
                else%白色
                    bw2(a,b)=255;
                    bw2(a+1,b)=255;
                end
            case 2
                %子图1
                bw1(a,b+1)=255;
                bw1(a+1,b)=255;
                %子图2
                if A_bw(i,j) == 0%黑色
                    bw2(a,b)=255;
                    bw2(a+1,b+1)=255;
                else%白色
                    bw2(a,b+1)=255;
                    bw2(a+1,b+1)=255;
                end
            case 3
                %子图1
                bw1(a,b+1)=255;
                bw1(a+1,b+1)=255;
                %子图2
                if A_bw(i,j) == 0%黑色
                    bw2(a,b)=255;
                    bw2(a+1,b)=255;
                else%白色
                    bw2(a+1,b)=255;
                    bw2(a+1,b+1)=255;
                end
        end
    end
end

for i = 1:2*x
    for j = 1:2*y
        % 先恢复成与bw1和bw2同等大小，即叠加到一起
        bw3(i,j)=bw1(i,j)&bw2(i,j);
    end
end

for i = 1:x
    for j = 1:y
        % 再恢复成与A_bw同等大小，即缩小清晰化处理
        a=2*i-1;
        b=2*j-1;

        res=0;
        for i1 = 0:1
            for j1 = 0:1
                res = res | bw3(a+i1,b+j1);
            end
        end
        bw4(i,j)=res;
    end
end
end