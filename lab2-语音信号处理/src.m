%%

% Clear Memory and Command window
clc;
clear all;
close all;
[x, fs] = audioread('sound.wav');
plot(x);
%%
fx = fft(x);
subplot(6,1,1);plot(abs(fftshift(fx)));
[a, fs] = audioread('sound.wav');
[ca1, cd1] = dwt(a(:,1), 'db4');
a0=idwt(ca1, cd1, 'db4', length(a(:,1)));
subplot(6,1,2);plot(a(:,1));
subplot(6,1,3);plot(cd1);
subplot(6,1,4);plot(ca1);
subplot(6,1,5);plot(a0);

[a, fs] = audioread('sound.wav');
res = dct(a);
subplot(6,1,6);plot(res);
