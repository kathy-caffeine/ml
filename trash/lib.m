h = draw_all(0,-12 ,10, [0.9290 0.6940 0.1250], [0 0.4470 0.7410], 'red', [0.4940 0.1840 0.5560]);

% возвращает матрицу из слайса и двух 3д графиков
function [h, s] = draw_all(x,y,z, color_0, color_1, color_2, color_3)
attractor1 = readtable("attractor_1.xlsx");
attractor2 = readtable("attractor_2.xlsx");

x_1 = attractor1.Amplitude_Plot0(1:10000);
x_2 = attractor2.Amplitude_Plot0(1:10000);
y_1 = attractor1.Amplitude_Plot1(1:10000);
y_2 = attractor2.Amplitude_Plot1(1:10000);
z_1 = attractor1.Amplitude_Plot2(1:10000);
z_2 = attractor2.Amplitude_Plot2(1:10000);

V = matrix();
x_3 = -15:0.1:14.9;
y_3 = -14:0.1:13.9;
z_3 = -2:0.1:38;

% отрисовка
figure;
map = [
    color_0
    color_1
    color_0
    color_1
    ];

h = matrix;

colormap(map);
s = slice(y_3, x_3, z_3, V, x, y, z);
set(s, 'EdgeColor','none');

hold on;
h(2) = plot3(y_1, x_1, z_1, 'Color', color_3);
h(3) = plot3(y_2, x_2, z_2, 'Color', color_2);
hold off;
end

function [h] = draw_slice(x,y,z, color_0, color_1)
V = matrix();
x_3 = -15:0.1:14.9;
y_3 = -14:0.1:13.9;
z_3 = -2:0.1:38;

% отрисовка
figure;
map = [
    color_0
    color_1
    color_0
    color_1
    ];
colormap(map);
h = slice(y_3, x_3, z_3, V, x, y, z);
end

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