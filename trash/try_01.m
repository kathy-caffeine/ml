attractor1 = readtable("attractor_1.xlsx");
attractor2 = readtable("attractor_2.xlsx");

x_1 = attractor1.AmplitudePlot0(1:10000);
x_2 = attractor2.AmplitudePlot0(1:10000);
y_1 = attractor1.AmplitudePlot1(1:10000);
y_2 = attractor2.AmplitudePlot1(1:10000);
z_1 = attractor1.AmplitudePlot2(1:10000);
z_2 = attractor2.AmplitudePlot2(1:10000);
V = matrix();

x = 100; y = 100; z = 100;

% отрисовка
figure;
axis([-15 15 -14 14 -2 38]);
h_1 = plot3(x_1, y_1, z_1);
hold on;
h_2 = plot3(x_2, y_2, x_2);
%x_scale = (-15:0.1:15);
%y_scale = (-14:0.1:14);
%z_scale = (-2:0.1:38);
h_3 = slice(V, x, y, z);
hold off;


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