function fractalNewton(f, df, lims, res)
% fractalNewton - Programa que dibuja un fractal a partir de una función
% dada y su derivada usando el método de Newton. Para ello, utiliza números
% complejos y así produce una gráfica de dos dimensiones.
%   Entradas: 
%           f    - una función
%           df   - la derivada de la función
%           lims - un vector con los límites del plano a graficar en el
%                  siguiente orden: límite inferior del eje "x", límite
%                  superior del eje "x", límite inferior del eje "y" y
%                  límite superior del eje "y"
%           res  - el número de puntos en los que se va a dividir cada eje
%                  para poder graficar el fractal; es decir, se construirá
%                  una gráfica de (res x res) puntos
%   Ejemplo:
%       f = @(z) z^3 - 1;
%       df = @(z) 3*z^2;
%       lims = [-1 1 -1 1];
%       res = 1000;
%       fractalNewton(f, df, lims, res);

%% Calcular las raíces de la función dada.
% Si bien esta parte no es necesaria y podríamos simplemente pasar, como
% parámetros, las raíces de la función que se definió, decidimos incluirlo
% en el código para facilitar las pruebas que hicimos y ahorrarnos el
% cálculo de las raíces. Aunque no es parte del curso, en este caso
% abusamos del cálculo simbólico. Posteriormente guardamos todas las raíces
% en un arreglo y también guardamos el número de raíces que hay.
syms z
eq = f(z) == 0;
sol = solve(eq);
roots = double(sol);
n = length(roots);

%% Definir un grid que fungirá como plano complejo.
% Tendremos una matriz Z que tendrá como elementos a números complejos.
% Recordemos que deseamos hacer una especie de analogía del plano R^2 con
% el plano complejo; es decir, el eje de las ordenadas representará a la
% componente real del número complejo y el eje de las abscisas representará
% a la componente imaginaria del número complejo. También vamos a crear una
% matriz del mismo tamaño, pero con puros ceros, y que usaremos en la
% siguiente sección.
x = linspace(lims(1), lims(2), res); 
y = linspace(lims(3), lims(4), res);
[X,Y] = meshgrid(x,y);
Z = X + 1i*Y;
C = zeros(size(Z));

%% Aplicar el método de Newton a cada punto.
% Para esta parte, aprovechamos el código hecho en clase que calcula la
% raíz de una función usando el método de Newton y partiendo de un punto
% dado. Esto lo haremos para cada punto de la matriz Z y lo almacenaremos
% nuevamente ahí. Posteriormente, compararemos el resultado con cada una de
% las raíces que tenemos y almacenaremos el número de raíz que corresponde
% a cada punto, con el fin de poder usar la función colormap después. Es
% decir, al final de estos ciclos, la matriz C quedará con puros números
% enteros del 0 a n, donde cada número corresponde a la raíz a la que
% convergió ese punto y se tendrá 0 si el punto en cuestión no convergió.
for i = 1:length(y)
    for j = 1:length(x)
        [Z(i,j), ~, ~] = metodoNewtonRaices(f, df, Z(i,j), 1e-6);
        
        for k = 1:n
            if abs(Z(i,j) - roots(k)) < 0.001
                C(i,j) = k;
            end
        end
    end
end

%% Graficar la matriz Z.
figure
image(lims(1:2), lims(3:4), C, 'CDataMapping','scaled');

% Podemos alterar el colormap elegido para colorear a nuestro gusto el
% fractal. También podemos crear nuestro propio colormap. Ver anexo al
% final del código. Solamente hay que respetar el (n+1) dentro del colormap
% elegido.
colormap(bone(n+1));

% Orientar correctamente el eje imaginario y agregar las etiquetas
% correspondientes a cada eje para una mejor comprensión de la gráfica.
set(gca, 'YDir', 'normal');
set(gca, 'XTick', linspace(lims(1), lims(2), 5));
set(gca, 'YTick', linspace(lims(3), lims(4), 5));

% String para definir el título del fractal. Usaremos LaTex para que se vea
% más bonito, pero no es necesario.
s1 = 'Fractal de $f(z)=';
s2 = char(f);
s2 = s2(5:end);
s2 = strrep(s2, '*', '');
s2 = strrep(s2, '.', '');
s = strcat(s1, s2, '$');
title(s, 'Interpreter', 'latex', 'FontSize', 16);
xlabel('Re($z$)', 'Interpreter', 'latex', 'FontSize',14);
ylabel('Im($z$)', 'Interpreter', 'latex', 'FontSize',14);
axis equal; axis tight;

%% Anexo: built-in colormaps. Son los que podemos usar.
% parula
% jet
% hsv
% hot
% cool
% spring
% summer
% autumn
% winter
% gray
% bone
% copper
% pink
% lines
