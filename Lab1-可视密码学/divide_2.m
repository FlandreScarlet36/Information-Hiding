% 叠象术: 将二值图像fig1，隐藏到fig2和fig3中
% fig1: 需要操作的二值图像
% fig2: 要隐藏到的原图1
% fig3: 要隐藏到的原图2
% bw1: 图像1
% bw2: 图像2
% bw3: 用图像1和图像2叠加进行恢复
% bw4: 将bw3恢复fig1
function [bw1,bw2,bw3,bw4]=divide_2(fig1,fig2,fig3)
x=size(fig1, 1);
y=size(fig1, 2);

bw1 = zeros(2*x,2*y);
bw2 = zeros(2*x,2*y);

% bw3和bw4存储恢复的图像
bw3 = zeros(2*x,2*y);
bw4 = zeros(x,y);


for i = 1:x
    for j = 1:y
        a=2*i-1;
        b=2*j-1;
        rand_i=randi([1,4]);
        % 0:黑 1:白
        if fig1(i,j)==0 && fig2(i,j)==0 && fig3(i,j)==0
            %黑黑黑
            switch rand_i
                case 1
                    bw1(a,b+1)=255;
                    bw2(a,b)=255;
                case 2
                    bw1(a+1,b+1)=255;
                    bw2(a+1,b)=255;
                case 3
                    bw1(a,b)=255;
                    bw2(a,b+1)=255;
                case 4
                    bw1(a+1,b)=255;
                    bw2(a+1,b+1)=255;
            end
        elseif fig1(i,j)==0 && fig2(i,j)==0 && fig3(i,j)~=0
            %黑黑白
            switch rand_i
                case 1
                    bw1(a,b)=255;
                    bw2(a+1,b)=255;
                    bw2(a+1,b+1)=255;
                case 2
                    bw1(a,b+1)=255;
                    bw2(a,b)=255;
                    bw2(a+1,b)=255;
                case 3
                    bw1(a+1,b)=255;
                    bw2(a,b)=255;
                    bw2(a,b+1)=255;
                case 4
                    bw1(a+1,b+1)=255;
                    bw2(a,b+1)=255;
                    bw2(a+1,b)=255;
            end
        elseif fig1(i,j)==0 && fig2(i,j)~=0 && fig3(i,j)==0
            %黑白黑
            switch rand_i
                case 1
                    bw1(a,b)=255;
                    bw1(a,b+1)=255;
                    bw2(a+1,b+1)=255;
                case 2
                    bw1(a,b+1)=255;
                    bw1(a+1,b+1)=255;
                    bw2(a,b)=255;
                case 3
                    bw1(a+1,b)=255;
                    bw1(a+1,b+1)=255;
                    bw2(a,b+1)=255;
                case 4
                    bw1(a,b)=255;
                    bw1(a+1,b+1)=255;
                    bw2(a+1,b)=255;
            end
        elseif fig1(i,j)==0 && fig2(i,j)~=0 && fig3(i,j)~=0
            %黑白白
            switch rand_i
                case 1
                    bw1(a,b)=255;
                    bw1(a,b+1)=255;
                    bw2(a+1,b)=255;
                    bw2(a+1,b+1)=255;
                case 2
                    bw1(a,b+1)=255;
                    bw1(a+1,b+1)=255;
                    bw2(a,b)=255;
                    bw2(a+1,b)=255;
                case 3
                    bw1(a+1,b)=255;
                    bw1(a+1,b+1)=255;
                    bw2(a,b)=255;
                    bw2(a,b+1)=255;
                case 4
                    bw1(a,b)=255;
                    bw1(a+1,b+1)=255;
                    bw2(a,b+1)=255;
                    bw2(a+1,b)=255;
            end
        elseif fig1(i,j)~=0 && fig2(i,j)==0 && fig3(i,j)==0
            %白黑黑
            switch rand_i
                case 1
                    bw1(a+1,b+1)=255;
                    bw2(a+1,b+1)=255;
                case 2
                    bw1(a+1,b)=255;
                    bw2(a+1,b)=255;
                case 3
                    bw1(a,b)=255;
                    bw2(a,b)=255;
                case 4
                    bw1(a,b+1)=255;
                    bw2(a,b+1)=255;
            end
        elseif fig1(i,j)~=0 && fig2(i,j)==0 && fig3(i,j)~=0
            %白黑白
            switch rand_i
                case 1
                    bw1(a+1,b+1)=255;
                    bw2(a,b+1)=255;
                    bw2(a+1,b+1)=255;
                case 2
                    bw1(a+1,b)=255;
                    bw2(a,b+1)=255;
                    bw2(a+1,b)=255;
                case 3
                    bw1(a,b+1)=255;
                    bw2(a,b)=255;
                    bw2(a,b+1)=255;
                case 4
                    bw1(a,b)=255;
                    bw2(a,b)=255;
                    bw2(a+1,b)=255;
            end
        elseif fig1(i,j)~=0 && fig2(i,j)~=0 && fig3(i,j)~=0
            %白白白
            switch rand_i
                case 1
                    bw1(a,b)=255;
                    bw1(a+1,b)=255;
                    bw2(a+1,b)=255;
                    bw2(a+1,b+1)=255;
                case 2
                    bw1(a+1,b)=255;
                    bw1(a+1,b+1)=255;
                    bw2(a,b+1)=255;
                    bw2(a+1,b)=255;
                case 3
                    bw1(a,b)=255;
                    bw1(a+1,b+1)=255;
                    bw2(a,b)=255;
                    bw2(a,b+1)=255;
                case 4
                    bw1(a,b)=255;
                    bw1(a,b+1)=255;
                    bw2(a,b)=255;
                    bw2(a+1,b)=255;
            end
        elseif fig1(i,j)~=0 && fig2(i,j)~=0 && fig3(i,j)==0
            %白白黑
            switch rand_i
                case 1
                    bw1(a,b)=255;
                    bw1(a,b+1)=255;
                    bw2(a,b)=255;
                case 2
                    bw1(a+1,b)=255;
                    bw1(a+1,b+1)=255;
                    bw2(a+1,b)=255;
                case 3
                    bw1(a,b)=255;
                    bw1(a+1,b+1)=255;
                    bw2(a+1,b+1)=255;
                case 4
                    bw1(a,b)=255;
                    bw1(a,b+1)=255;
                    bw2(a,b+1)=255;
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