set_settings();
%save("config.mat", "config");
%draw("config.mat");

% скрипт для первичной настройки изображения
function [] = set_settings()
V = matrix();
volumeViewer(V);
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

% скрипт отрисовки с готовыми настройками
function [] = draw(config)
c = load(config);
volshow(matrix(), c.config);
end