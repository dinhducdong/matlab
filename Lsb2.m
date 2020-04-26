clear;
%% nhap anh phu H va anh nhung W
H =imread('AT130411.bmp');
W=imread('A_32x32.tiff');
H1 = imresize(H,[512 512]);
W1= imresize(W,[512 512]);
rH=size(H1,1); %chieu rong
cH=size(H1,2); %chieu cao
rW=size(W1,1); 
cW=size(W1,2);       
%% Nhung thuy van
watermarked_image = H1;
if(rW>rH)||(cW>cH)
    disp('Khong du dung luong de thuy van!');
else
    for i = 1:rW
        for j = 1:cW
            %% Thay the bit LSB cua anh phu thanh bit anh nhung 
            watermarked_image(i,j)=bitset(watermarked_image(i,j),1,W1(i,j));
        end
    end
end
%% Hien thi anh sau khi nhung thuy van
imwrite( watermarked_image,'C:\Users\kinhk\Downloads\watermarked_image.bmp');
figure(1),
imshow(watermarked_image,[])
title('Anh nhung')
%% Trich xuat thuy van
T = imread('C:\Users\kinhk\Downloads\watermarked_image.bmp');
for i = 1:rW
    for j = 1:cW
        %% Lay bit LSB cau anh thuy van
        w2(i,j)=bitget(T(i,j),1);
    end
end
%% Hien thi anh trich xuat thuy van
imwrite( w2,'C:\Users\kinhk\Downloads\watermarked.bmp');
figure(2),
imshow(w2,[]);
title('Anh trich xuat')
