clear all;
clc;

%% 读取文件
fid_read = fopen("audio\Ship.mp3", 'rb'); % 打开要读取的二进制文件
data = fread(fid_read, 'uint8'); % 以uint8格式读取文件内容
fclose(fid_read); % 关闭文件

start_index = 1128; % 第一个数据帧的声音数据起始位置


%% 隐藏信息
information = "我是爱南开的; I Love NKU !";
inf_uni = unicode2native(information);% 将字符串转为unicode编码; 此处为 1x32 uint8
% native2unicode(inf_uni)
[dim,inf_len] = size(inf_uni);

index = start_index;
for i=1:inf_len
    for j=1:8
        % 使用 bitget 获取inf_uni(i)的第j比特
        hidden = bitget(inf_uni(i), j) ;

        % LSB设置为对应的数据
        data(index) = bitset(data(index),1,hidden);
        index = index + 1;
    end
end


%% 信息提取
inf_uni_recover = zeros(1,32, "uint8");
index = start_index;

for i=1:inf_len
    for j=1:8
        hidden = bitget(data(index),1);% 提取LSB数据
        index = index + 1;

        inf_uni_recover(i) = bitset(inf_uni_recover(i),j,hidden);%赋值
    end
end

inf_recover = native2unicode(inf_uni_recover);% 提取到的信息

%% 写入文件
fid_write = fopen("audio\Ship_hidden.mp3", 'wb'); % 创建一个新的二进制文件用于写入
fwrite(fid_write, data, 'uint8'); % 将读取的数据写入新文件
fclose(fid_write); % 关闭文件

%% 绘制音频图片
[audio, Fs] = audioread("audio\Ship.mp3");
[audio_hidden, Fs] = audioread("audio\Ship_hidden.mp3");

figure;
plot(audio);

figure;
plot(audio_hidden);




