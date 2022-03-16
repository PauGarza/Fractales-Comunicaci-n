function [x1,contador,error] = metodoNewtonRaices(f,df,x0,tol)
%METODONEWTONRAICES - Programa que calcula el algoritmo de Newton.
%   Entradas: f, df, x0, tol - funcion, intervalo y tolerancia
%   Salidas:             x1 - raiz con f(x1) proximo de cero
%   La solución c satisface estar a una distancia menor que tol de la
%   solución exacta
%
%   Ejemplo:
%       f = @(x) x^2 - 1;
%       df = @(x) 2.*x;
%       c = METODONEWTONRAICES(f,df,3,1e-8)
%---------- ---------- ---------- -//- ---------- ---------- ----------


%Inicialización
fx0 = f(x0);
dfx0 = df(x0);

%Protección para no dividir por cero
if dfx0 == 0
    disp("ERROR DIV/CERO: Checa la derivada evaluada en tu punto")
    x1 = NaN;
    return
end

x1 = x0 - (fx0 / dfx0);

contador = 0;

while((abs(x0 - x1 ) / abs(x1)) > tol)
    contador = contador + 1;
    x0 = x1;
    fx0 = f(x0);
    dfx0 = df(x0);
    x1 = x0 - (fx0 / dfx0);
    fx1 = f(x1);
    
    %Protección por DP. 
    %Después de cierto tiempo se puede llegar a un círculo, o un rombo,
    %donde las imagénes en valor absoluto de x0 y x1 sean las mismas, 
    %aunque x0 y x1 no necesariamente lo sean. Esto provocará que el 
    %algoritmo se quede atorado en un rombo de imagenes, y no pueda salir,
    %pues aún no alcanza la tolerancia. Para eso, ponemos la siguiente la
    %protección.
    if (abs(fx1) == abs(fx0))
        error = ((abs(x0 - x1 ) / abs(x1)));
        return
    end
    
    %En caso de que surja la raíz
    if fx1 == 0
        %disp("Se ha llegado a la solución exacta")
        error = ((abs(x0 - x1 ) / abs(x1)));
        return
    end
       
end 
error = ((abs(x0 - x1 ) / abs(x1)));

return
