# Fractales de Newton

Programa que crea fractales a partir del método Newton en MATLAB.

## Índice
- 1. Introducción a fractales
  - 1.1 ¿Qué es un fractal?
  - 1.2 ¿Cómo modelar un fractal?
- 2. Construcción del programa
  - 2.1 Cálculo de raíces de la función
  - 2.2 Grid que funciona como el campo complejo
  - 2.3 Método de Newton para cada punto
  - 2.4 Asignación de un color a cada punto
  - 2.5 Gráfica
- 3. Utilización del programa
  - 3.1 Requisitos
  - 3.2 Uso
- 4. Referencias

## 1. Introducción a fractales

### 1.1 ¿Qué es un fractal?

Un fractal es una imagen que muestra porcesos iterativos que se repiten al infinito; es una figura autosemejante, es decir, es una figura que se parece a cada parte que la compone a diferentes escalas. 

En la naturaleza podemos observar diferentes fractales: las hojas de un helecho, las nubes, el sistema circulatorio, las líneas costeras​ o los copos de nieve.

![Ejemplo de fractales en la naturaleza](imgs/fractales_naturaleza.jpg)

### 1.2¿Cómo modelar un fractal?

Este programa se basa en el trabajo de Caley. Este matemático utilizó el método de Newton para encontrar las raíces de una función definida en el plano complejo. Asimismo, Caley define las cuencas de atracción como el conjunto de puntos en el plano complejo tales que si aplicas el método de Newton convergen a una raíz determinada. Al colorear las diferentes cuencas de atracción de diferentes colores podemos observar un fractal.

![Ejemplo de fractales de Newton](imgs/gr%C3%A1ficas_fractales.png)


## 2. Construcción del programa

### 2.1 Cálculo de raíces de la función
Para obtenerlas, el programa utiliza el cálculo simbólico de Matlab y almacena los resultados en un arreglo. También guarda el número de raíces que hay.


### 2.2 Grid que funciona como el campo complejo
Se basa en los límites que fueron pasados como parámetros. En orden, los parámetros que se pasan en la función son:
1. límite inferior del eje real
2. límite superior del eje real
3. límite inferior del eje imaginario
4. límite superior del eje imaginario

El parámetro `res`, indicica el número de puntos en el que se divide cada recta. Con el comando `linspace()` de Matlab se almacena cada uno de los valores de las rectas en un arreglo por separado. Posteriormente, con `meshgrid()` se crean dos matrices, `X` y `Y`, cuyas entradas son copias de las filas y columnas de `x` y `y`, respectivamente. Después,se combinan ambas matrices en una misma matriz `Z`, no sin antes multiplicar a `Y` por `i`, para que realmente almacenemos números complejos. Finalmente, se crea una matriz del mismo tamaño que `Z`, llena de ceros; esta matriz se utiliza en la siguiente sección.

```matlab
x = linspace(lims(1), lims(2), res); 
y = linspace(lims(3), lims(4), res);
[X,Y] = meshgrid(x,y);
Z = X + 1i*Y;
C = zeros(size(Z));
```

### 2.3 Método de Newton para cada punto
Esta parte aprovecha el código ya construido que calcula la raíz de una función usando el método de Newton partiendo de un punto dado. Esto se hace para cada punto `(i, j)` de la matriz `Z` y almacena el resultado nuevamente ahí. 


### 2.4 Asignación de un color a cada punto
Para asignar el color, el programa compara cada resultado con cada una de las raíces y, si el resultado obtenido es menor que una cota arbitraria (en este caso estamos usando 0.001), entonces almacena en la matriz `C` el número que corresponde a esa raíz. 

El paso 3 y 4 se hacen en un mismo ciclo.

### 2.5 Gráfica
En este último paso se orienta correctamente el eje imaginario y se asigna un color a cada raíz. Nosotros escogimos el mapa de colores `bone`. El usuario puede poner el que más le parezca:

```matlab
figure
image(lims(1:2), lims(3:4), C, 'CDataMapping','scaled');
colormap(bone(n+1));

set(gca, 'YDir', 'normal');
set(gca, 'XTick', linspace(lims(1), lims(2), 5));
set(gca, 'YTick', linspace(lims(3), lims(4), 5));
```

## 3. Utilización del programa 

### 3.1 Requisitos

- Los archivos del directorio `src/` deben estar en el directorio de trabajo de Matlab.
- Es necesario tener __Symbolic Toolbox__ instalado en Matlab.

### 3.2 Uso

Para generar un fractal necesitas 
- un polinomio complejo, 
- su derivada, 
- los límites en el plano complejo en el que quieres visualizar el fractal y 
- el número de puntos que quieres gráficar, es decir, la resolución.

```matlab
%Polinomio de grado 3
f = @(z) z.^3-1;  
df = @(z) 3*z.^2;
lims = [-1 1 -1 1];
res = 1000;
```

El archivo ejecutable del programa es `fractales.m`. Al ejecutar este archivo en Matlab se generan las graficas de los fractales usando la función de `fractalNewton` o `fractalReal` con los parámetros indicados:

```matlab
fractalNewton(f, df, lims, res);
```

 En el archivo se encuentran varios ejemplos de fractales en código comentado. Para visualizarlos se debe descomentar el código.

 Los archivos de apoyo son estos: 
- `fractalNewton.m` - contiene la función que genera fractales de funciones complejas.
- `fractalReal.m` - aquí se encuentra la función que grafica cuencas de atracción de funciones reales.
- `metodoNewtonRaices` - tiene en método de convergencia que se utiliza en `fractalNewton.m`


## 4. Referencias
- [Ejemplo de fractales en la naturaleza](https://twitter.com/cajafresca/status/1005094073668161536)