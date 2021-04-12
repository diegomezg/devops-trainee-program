#!/bin/bash

# En este script se imprime lo que esta pasando line por linea con una trampa ciclada para cada linea

# Declaras la trampa para que imprima cada linea del script a partir de aqui hacia abajo,
# el contenido de la variable $a(es como un ciclo en la trampa y se acaba hasta que acaba el script)
trap 'echo "[DEBUG] a = \"$a\""' DEBUG

# Declaras la variable $a con el valor de 3 y la variabele line del numero que tiene la linea gracias a $LINENO
a=3;
line=$LINENO

# imprimes el texto en pantalla
echo " Variable \$a initialized to $a on the line $line"

# multiplicas el valor de la variable $a por 2 y reinicias la variable line por el numero de la linea $LINENO
let "a *= 2";
line=$LINENO

# imprimes el texto en pantalla
echo "Variable \$a multiplied by 2 on the line $line"
