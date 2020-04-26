c = [125 176 255 130 87 86 90 95 100 102 112 134 180 239 235 240 189 200 213 254 219 211 243 4];
m = [0 1 1 1 1 0 0 0 0 1 1 0 1 0 0 1]; 
% neu la chuoi thi dung str2double(m(count))
[row,column] = size(c); % lay gia tri hang + cot
stego = c ; 
count =1;
len = size(m,2); % lay chieu dai cau chuoi nhung
if len > column
    fprintf("khong the nhung");
else
for i=1:row
    for j=1:column
        if count <= len
            LSB = mod(c(i,j),2);% lay bit LSB
            temp = double(xor(LSB,m(count)));% xor(bit lsb voi tung bit trong m)
            stego(i,j) = c(i,j)+ temp;% hien thi stego sau khi nhung
            count = count+1;
        end
    end
end
end
