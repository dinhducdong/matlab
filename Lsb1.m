clc;
clear;
% Chon anh goc
orig1 = imread('AT130411.bmp');
% Chon anh nhung
message1 = imread('baboon.bmp');
orig = imresize(orig1,[512 512]);
message =imresize(message1,[512 512]);
% Cai dat mang figure
f1 = figure('Name', 'Thuc hien nhung');
f2 = figure('Name', 'Thuc hien  trich xuat');
% Thuc thi lay cac bit trong vat phu
B1 = bitget(orig, 1);
B2 = bitget(orig, 2);
B3 = bitget(orig, 3);
B4 = bitget(orig, 4);
B5 = bitget(orig, 5);
B6 = bitget(orig, 6);
B7 = bitget(orig, 7);
B8 = bitget(orig, 8);
% Thuc thi lay cac bit trong vat nhung
BW1 = bitget(message, 1);
BW2 = bitget(message, 2);
BW3 = bitget(message, 3);
BW4 = bitget(message, 4);
BW5 = bitget(message, 5);
BW6 = bitget(message, 6);
BW7 = bitget(message, 7);
BW8 = bitget(message, 8);
%nhung thay the bit LSB anh phu + MSB trong anh nhung 
watermarked3 = B8*2^7+B7*2^6+B6*2^5+B5*2^4+B4*2^3+BW8*2^2+BW7*2^1+BW6*2^0;
watermarked5 = B8*2^7+B7*2^6+B6*2^5+BW8*2^4+BW7*2^3+BW6*2^2+BW7*2^1+BW6*2^0;
watermarked7 = B8*2^7+BW8*2^6+BW7*2^5+BW6*2^4+BW5*2^3+BW4*2^2+BW3*2^1+BW2*2^0;
figure(f1),subplot(1,2,1), imshow(orig),title('Anh phu');
figure(f1),subplot(1,2,2), imshow(watermarked3,[]), title('Watermarked 3 bit');

%% trich xuat
watermarked = (watermarked3);
% Doc watermarked
%watermarked3 = imread('');
figure(f2), subplot(1,2,1), imshow(watermarked,[]), title('Watermarked');
% Lay thong tin cac bit trong watermarked
W1 = bitget(watermarked, 1);
W2 = bitget(watermarked, 2);
W3 = bitget(watermarked, 3);
message = W1*2^0+W2*2^1+W3*2^2;
figure(f2), subplot(1,2,2), imshow(message,[]), title('Trich xuat');
