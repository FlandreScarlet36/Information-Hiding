%% 进行高斯滤波
clc, clear;
imdata_h = imread('./IMG/lenna_h.bmp');
sigma = 1;
gausFilter = fspecial('gaussian', [5,5], sigma);
imdata_ft = imfilter(imdata_h, gausFilter, 'replicate');
[row, col] = size(imdata_ft);
% imdata_ft = reshape(imdata_ft,[],1);
imwrite(imdata_ft, './lenna_gaus.bmp');
%% JPEG压缩攻击
clc, clear;
imdata_h = imread('./IMG/lenna_h.bmp');
imwrite(imdata_h, 'lenna_jpg.jpg','Quality', 100);
imdata_ft = imread('./lenna_jpg.jpg');
[row, col] = size(imdata_ft);
%%
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
        tmp = (2^j-1)*double(imdata_ft(pt + shifted_pos)); % 需要转换为double
        f_tmp = f_tmp + tmp;
    end
    f_tmp = mod(f_tmp, 2^(N+1));
    message_embeded_extracted(i) = f_tmp;
end
%%
m_org = load('./message_embed_orgin.mat');
m_org = m_org.message_embed_form;
count = 0;
total_bits = 0;

for i = 1:length(m_org)
    org = dec2bin(m_org(i), 4);
    extracted = dec2bin(message_embeded_extracted(i), 4);
    for j = 1:4
        total_bits = total_bits + 1;
        if org(j) ~= extracted(j)
            count = count + 1;
        end
    end
end

error_rate = count / total_bits;
fprintf('错误率: %.2f%%\n', error_rate * 100);


% message_embeded_extracted = reshape(message_embeded_extracted,2,[]);
% [~, M] = size(message_embeded_extracted);
% message_bt = zeros(1,M);
% for i = 1:M
%    l4bit = message_embeded_extracted (1,i);
%    h4bit = message_embeded_extracted (2,i);
%    cur_uint8 = bitshift(h4bit,4) + l4bit;
%    cur_uint8 = uint8(cur_uint8);
%    message_bt(i) = cur_uint8;
% end
% message = native2unicode(message_bt, 'UTF-8');

