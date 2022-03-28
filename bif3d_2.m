%set_settings();
%save("config.mat", "config");
%draw("config.mat");

draw_part_2()

% скрипт для первичной настройки изображения и вывода целой фигуры
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

% скрипт отрисовки срезов
function [] = draw_part(a, b, c, config)
V = matrix();
for i = 1:size(V, 1) %x
    for j = 1:size(V, 2) %y
        for k = 1:size(V, 3) %z
            if(k ~= c || j ~= b || i ~= a)
                V(i,j,k) = NaN;
            end
        end
    end
end
%c = load(config);
volshow(V, config);
end

% скрипт отрисовки эбол
function [] = draw_part_2()
V = matrix();
for i = 1:size(V, 1) %x
    for j = 1:size(V, 2) %y
        for k = 1:size(V, 3) %z
            if(V(i,j,k)~=3 || V(i,j,k)~=4)
                V(i,j,k) = 0;
            end
        end
    end
end
c = load("config01.mat");
volshow(V, c.config);
end

% скрипт отрисовки эбол и среза
function [] = draw_part_3(a, b, c, config)
V = matrix();
for i = 1:size(V, 1) %x
    for j = 1:size(V, 2) %y
        for k = 1:size(V, 3) %z
            if(V(i,j,k)~=3 || V(i,j,k)~=4 || k ~= c || j ~= b || i ~= a)
                V(i,j,k) = null;
            end
        end
    end
end
c = load(config);
volshow(matrix(), c.config);
end

% скрипт отрисовки эбол и среза
function [] = draw_part_4(a, b, c)
V = matrix();
for i = 1:size(V, 1) %x
    for j = 1:size(V, 2) %y
        for k = 1:size(V, 3) %z
            if(V(i,j,k)==3)
                V(i,j,k) = 0;
            end
            if(V(i,j,k)==4)
                V(i,j,k) = 1;
            end
        end
    end
end
c = load("config01.mat");
volshow(matrix(), c.config);
end