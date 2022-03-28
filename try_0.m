Z = draw_part_2(matrix());
figure;
h = mesh(Z);
view(3);
axis on;
light;
lighting phong;
camlight('left');
shading interp;

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

% скрипт отрисовки эбол
function [V] = draw_part_2(V)
for i = 1:size(V, 1) %x
    for j = 1:size(V, 2) %y
        for k = 1:size(V, 3) %z
            if(V(i,j,k)~=3 || V(i,j,k)~=4)
                V(i,j,k) = 0;
            end
        end
    end
end
end