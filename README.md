# Fractales de Newton

## ¿Qué hace el programa? (pau)

### Primero que nada: ¿qué es un fractal?
La mejor manera de explicarlo es enseñando algunas fotos:

## ¿Cómo usar el programa? (pau)

### Instalación

### Uso

## ¿Cómo —y, sobre todo, por qué— funciona el programa? (Beto)

A muy grandes rasgos, el programa:
1. calcula las raíces de la función que le pasamos como argumento;
1. genera una cuadrícula en donde cada punto de la cuadrícula se puede representar por un número complejo;
1. aplica el Método de Newton usando a cada punto de la cuadrícula como punto de partida y se fija en qué raíz se acerca más después de un número determinado de iteraciones, y
1. asigna un color a cada punto según la raíz a la que dicho punto inicial haya convergido.

### El método de Newton
Para explicar por qué realizamos cada paso, primero vamos a explicar brevemente el Método de Newton: es un algoritmo recursivo que permite obtener las raíces de una función si conocemos únicamente la regla de correspondencia, la derivada y una aproximación inicial, denotada $x_0$. Si $x_n$ es nuestra aproximación actual, la regla para calcular la siguiente aproximación ($x_{n+1}$) es la siguiente:
$$ x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}. $$
Básicamente, lo que el método nos dice es que, dado un punto en el eje $x$, podemos "acercarnos" a la raíz de una función si evaluamos ese punto en la función, tomamos la pendiente en el resultado y, siguiendo la pendiente, avanzamos hasta llegar al eje de las abscisas; el punto en donde crucemos al eje será nuestra nueva aproximación. Este proceso está muy bien ilustrado en la siguiente animación:

![Animación del Método de Newton](imgs/newtonsMethod.gif)

Ahora bien, los más matemáticamente inclinados se habrán preguntado ya: ¿qué pasa cuando la función tiene más de una raíz? La intuición nos dice que, como no podemos cambiar ni la función ni la derivada, entonces diferentes puntos iniciales nos llevarán a diferentes raíces. Veamos la siguiente gráfica de $f(x)=x^3-x$. El lector podrá verificar que si empezamos a la izquierda de $M_1$, el Método de Newton nos va a dejar cerca de $r_1$ y, si empezamos a la derecha de $M_2$, vamos a terminar en $r_3$.

![Tres raíces](imgs/grafica_tres_raices.png)

Hagamos algo más interesante: ¿qué pasa si empezamos entre $M_1$ y $M_2$? ¡Es un caos! Puede que terminemos en cualquiera de las tres raíces. Para no dejar al lector con la imaginación volando, vamos a colorear a todos los puntos que nos lleven a $r_1$ de color azul, a los que nos lleven a $r_2$ de rojo y a los que nos lleven a $r_3$ de verde. Podemos esperar que todos los puntos a la izquierda de $M_1$ se vean azules y todos los puntos a la derecha de $M_2$ se vean verdes. Así pues, fijémonos en lo que pasa en medio:

![Colores de las cuencas de atracción](imgs/colores.png)

## Referencias
- [GIF de Animación del Método de Newton](https://commons.wikimedia.org/wiki/File:NewtonIteration_Ani.gif)