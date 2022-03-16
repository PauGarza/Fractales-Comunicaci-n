function fractalReal(f, df, lims, res)
% fractalReal - Programa que dibuja un fractal a partir de una función
% dada y su derivada usando el método de Newton. Esto lo hace usando
% únicamente números reales, por lo que produce una gráfica de una
% dimensión nada más.
%   Entradas: 
%           f    - una función
%           df   - la derivada de la función
%           lims - un vector con los límites de la recta de los números que
%                  se usarán; primero se introduce el límite inferior y
%                  luego el límite superior
%           res  - el número de puntos en los que se va a dividir el eje
%   Ejemplo:
%       f = @(x) x.^3 - x;
%       df = @(x) 3*x.^2-1;
%       lims = [-2 2];
%       res = 100000;
%       fractalReal(f, df, lims, res);

%% Calcular las raíces de la función dada.
% Si bien esta parte no es necesaria y podríamos simplemente pasar, como
% parámetros, las raíces de la función que se definió, decidimos incluirlo
% en el código para facilitar las pruebas que hicimos y ahorrarnos el
% cálculo de las raíces. Aunque no es parte del curso, en este caso
% abusamos del cálculo simbólico. Posteriormente guardamos todas las raíces
% en un arreglo y también guardamos el número de raíces que hay.
syms t
eq = f(t) == 0;
sol = solve(eq);
roots = double(sol);
n = length(roots);
%% Definir la recta de puntos que vamos a utilizar para graficar.
x = linspace(lims(1), lims(2), res); 
X = zeros(size(x));
evf = f(x);
%% Aplicar el método de Newton a cada punto.
% Para esta parte, aprovechamos el código hecho en clase que calcula la
% raíz de una función usando el método de Newton y partiendo de un punto
% dado. Esto lo haremos para cada punto del arreglo x y lo almacenaremos
% nuevamente ahí. Posteriormente, compararemos el resultado con cada una de
% las raíces que tenemos y almacenaremos el número de raíz que corresponde
% a cada punto, con el fin de poder usar la función colormap después. Es
% decir, al final de estos ciclos, el arreglo X quedará con puros números
% enteros del 0 a n, donde cada número corresponde a la raíz a la que
% convergió ese punto y se tendrá 0 si el punto en cuestión no convergió.
for i = 1:length(x)
    [x(i), ~, ~] = metodoNewtonRaices(f, df, x(i), 1e-6);
    for k = 1:n
        if abs(x(i) - roots(k)) < 0.00001
            X(i) = k;
        end
    end
end
%% Graficar el arreglo X.
figure
image(lims, evf, X, 'CDataMapping', 'scaled');

% Podemos alterar el colormap elegido para colorear a nuestro gusto el
% fractal. También podemos crear nuestro propio colormap. Ver anexo de
% fractaNewton.m
colormap(autumn(n+1));

% Orientar correctamente el eje "y" y agregar las etiquetas al eje "x".
set(gca, 'YDir', 'normal');

% String para definir el título del fractal. Usaremos LaTex para que se vea
% más bonito, pero no es necesario.
s1 = 'Cuencas de $f(x)=';
s2 = char(f);
s2 = s2(5:end);
s2 = strrep(s2, '*', '');
s2 = strrep(s2, '.', '');
s = strcat(s1, s2, '$');
title(s, 'Interpreter', 'latex', 'FontSize', 16);
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$f(x)$', 'Interpreter', 'latex', 'FontSize', 14);