%%
clc,clear

% imdata = imread('./lenan.bmp');
POS = 20000; % 要嵌入的起始位置
N = 3; % GEMD N参数 , N最好为奇数


message = '信息隐藏技术';
message_byte = unicode2native(message, 'UTF-8');
[~,n] = size(message_byte);
message_int_4bit = zeros(2, n);
for i = 1:n
    cur_uint = message_byte(i);
    message_int_4bit(1,i) = bitand(cur_uint, 0x0f);% 低四位组成的整数
    message_int_4bit(2,i) = bitshift(cur_uint, -4);% 高四位组成的整数
end
message_embed_form = reshape(message_int_4bit, [], 1); % 要嵌入的信息

PIXEL_NUM = length(message_embed_form); %要嵌入的中心像素组组数
param = [POS, N, PIXEL_NUM];
save('param.mat', 'param');
save('message_embed_orgin.mat','message_embed_form')
%%
F = zeros(size(message_embed_form)); % 存储F函数所计算的值
imdata = imread('./IMG/lenna.bmp');
[row, col] = size(imdata);
imdata = reshape(imdata,[],1);
POS_END = POS + length(message_embed_form);
%%

for j = 1:PIXEL_NUM
    pt = POS + (j-1)*N; % 目前遍历的像素位置
    f_tmp = 0;
    for i = 1:N
        shifted_pos = i - (N+1)/2;
        tmp = (2^i-1)*double(imdata(pt + shifted_pos)); % 需要转换为double
        f_tmp = f_tmp + tmp;
    end
    f_tmp = mod(f_tmp, 2^(N+1));
    F(j) = f_tmp;
    d = double(message_embed_form(j)) - f_tmp;
    d = mod(d, 2^(N+1));
    x = d2x(d,N);
    
    ind = 1 : N;
    ind = ind - (N+1)/2 + pt;
    pixel_group = double(imdata(ind));
    px_changed = pixelChange(pixel_group,x,N,d);
    imdata(ind) = uint8(px_changed); % 更改像素值
end

%%
imdata = reshape(imdata,row,col);
imwrite(imdata, './IMG/lenna_h.bmp');
%% 下面开始解隐
clc, clear;
imdata_h = imread('./IMG/lenna_h.bmp');
[row, col] = size(imdata_h);
imdata_h = reshape(imdata_h,[],1);

paramobj = load('./param.mat');
param = paramobj.param;
POS = param(1);
N = param(2);
PIXEL_NUM = param(3);

message_embeded_extracted = zeros(PIXEL_NUM, 1); % 存储用于解隐后的信息
for i = 1:PIXEL_NUM
    pt = POS + (i-1)*N;
    f_tmp = 0;
    for j = 1:N
        shifted_pos = j - (N+1)/2;
        tmp = (2^j-1)*double(imdata_h(pt + shifted_pos)); % 需要转换为double
        f_tmp = f_tmp + tmp;
    end
    f_tmp = mod(f_tmp, 2^(N+1));
    message_embeded_extracted(i) = f_tmp;
end

message_embeded_extracted = reshape(message_embeded_extracted,2,[]);
[~, M] = size(message_embeded_extracted);
message_bt = zeros(1,M);
for i = 1:M
   l4bit = message_embeded_extracted (1,i);
   h4bit = message_embeded_extracted (2,i);
   cur_uint8 = bitshift(h4bit,4) + l4bit;
   cur_uint8 = uint8(cur_uint8);
   message_bt(i) = cur_uint8;
end
% message_byte = unicode2native(message, 'UTF-8');
message = native2unicode(message_bt, 'UTF-8');

%% 性能评估
org = imread('./IMG/lenna.bmp');
ch = imread('./IMG/lenna_h.bmp');
MSE = (org - ch).^2;
MSE = sum(sum(MSE,1))/(row*col) ;

PSNR = 10* log10(255^2/MSE);