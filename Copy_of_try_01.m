V = matrix();
x_3 = -15:0.1:14.9;
y_3 = -14:0.1:13.9;
z_3 = -2:0.1:38;

x = 0; y = 0; z = 0;

% отрисовка
figure;
s = slice(y_3, x_3, z_3, V, x, [], []); 
set(s, 'EdgeColor','none');
set(s, 'ColorMap', map);

% скрипт для создания матрицы
function [V] = matrix()
x = 300;
y = 280;
z = 401;

str = int2str(z);
n = strlength(str);

V = zeros(x,y,z);

for i = 1:z
    pStr = 'D:\3d\';
    m = floor(log10(i))+1;
    if m < n
        for j = m:n-1
            pStr = strcat(pStr,'0');
        end
    end
    pStr = strcat(pStr,sprintf('%d.txt',i));
    V(:,:,i) = dlmread(pStr);
end
end