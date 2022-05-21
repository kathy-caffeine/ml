x_3 = -15:0.1:14.9;
y_3 = -14:0.1:13.9;
z_3 = -2:0.1:38;
color_0 = [0.9290 0.6940 0.1250];
color_1 = [0 0.4470 0.7410];
colo2_2 = [1 0 0];
color_3 = [0.4940 0.1840 0.5560];
imagemap = [
    color_0
    color_1
    color_2
    color_3
    ];
x = 200; y = 0; z = 0;
Vx = V(x,:,:);
Vx = reshape(Vx, [280, 401]);
Vx = Vx.*2;

% отрисовка
im = image(y_3, z_3, Vx);
colormap(map);
%colormap(map);
%s = slice(y_3, x_3, z_3, V, x, [], []); 
%ax1.YAxis.Visible = 'off'; % remove x-axis
%s.FaceAlpha = 0.5;

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