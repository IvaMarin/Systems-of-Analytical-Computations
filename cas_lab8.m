disp('Лабораторная работа 8.');
disp('Упростить уравнение поверхности второго порядка в простраснтве в Octave');
disp('Задаем наше уравнение.');
[x, y, z] = ndgrid(-5:0.1:5, -5:0.1:5, -5:0.1:5);
fSrc = 2*x.^2 - 8*x.*y - 9*y.^2 + 4*y.*z + 3*z.^2 + x - y + z - 4;
disp('Построим исходную поверхность.');
figure;
isosurface(fSrc, 0);
disp('Задаем матрицу квадратичной формы.');
A = [2, -4, 0; -4, - 9, 2; 0, 2, 3];
disp('Получение собственных значений и собственных векторов.');
[vecs, vals] = eig(A)
disp('Получение характеристического полинома.');
polyParam = poly(A);
polyout(polyParam, 'x')
transCol1 = transpose(vecs(:, 1));
transCol2 = transpose(vecs(:, 2));
transCol3 = transpose(vecs(:, 3));
disp('Нормализованные векторы представляем в виде системы для получения нужных коэффициентов для канонической формы.');
ST = [transCol1; transCol2; transCol3]
a = [1; 1; 1];
a1 = ST*a
disp('Получили канонический вид для нашего исодного уравнения.');
fRes = vals(1,1)*x.^2 + vals(2,2)*y.^2 + vals(3,3)*z.^2 + 2*a1(1)*x + 2*a1(2)*y + 2*a1(3)*z - 4;
disp('Теперь построим график для уравнения в каноническом виде.');
figure;
isosurface(fRes, 0);
disp('Попытка задать систему и решить её.');
b = [0; 0; 0];
val1 = diag([vals(1, 1), vals(1, 1), vals(1, 1)]);
val2 = diag([vals(2, 2), vals(2, 2), vals(2, 2)]);
val3 = diag([vals(3, 3), vals(3, 3), vals(3, 3)]);
G1 = A - val1;
G2 = A - val2;
G3 = A - val3;
linsolve(G1, b)
linsolve(G2, b)
linsolve(G3, b)