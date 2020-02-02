# Shell scripting

```
#!/bin/bash
echo "Hello World"
```

## Introduction to bash

El primer shell o interprete de linea de comandos fue creado en 1971 para Unix por Ken Thompson. Este shell(/bin/sh) fue el primer programa de usuario que se ejecutaba fuera del kernel.

En 1977 Bourne shell fue desarrollado por Stephen Bourne. Este fue escrito con el fin the soportar ejecución interactiva de comandos, lo que dio el nacimiento del scripting.

Bourne shell introdujo conceptos más avanzados al shell como estructuras if,while,case, command substitution  and signal handling.


### Bash 

Es un interpretador de linea de comandos, es la shell de linux(un lenguaje de comando) que fue creado por la comunidad libre de GNU, el cual fue el reemplazo del Bourne shell

** Tipos de shell **
- bash (Bourne Again Shell)        =  mas y comunmente usado en linux y es como se describe arriba, solo que "bash" es un "bourne shell" con mas caracteristicas y mejor sintaxis, es mejorado, desarrollado por Brian Fox  del proyecto de GNU
- bourne shell(sh)                 =  fue el mas antiguo ya que fue la shell original de unix y fue reemplazada por "bash" desarrollado por Stephen Bourne en Bell Labs
- c shell (csh)                    =  es una shell de unix, el cual contiene diferentes caracteristicas que lo hacen diferentes al "bash" fue desarrollado por Bill Joy como una alternativa al "bash"
- korn shell (ksh)                 =  es una shell de unix basado en la fuente de "bourne shell", fue creado antes que "bash" desarrollado por David Korn en Bell Labs
- z shell (zsh)                    =  es una shell de unix basado en la fuente de "bourne shell",desarrolado por Paul Falstad

- **NOTA**: "Shell scripting" es un script en cualquier shell, por ejemplo bash scripting para bash y asi sucesivamente

`echo $SHELL`
`cat /etc/shells`

## Bash files

- **/etc/bash_profile**   es un archivo de configuracion para la shell de bash, cuando bash es invocado porque un usuario es logeado este primero lee y ejecuta comandos desde el archivo etc/profile si es que existe. despues de leer ese archivo este voltea a ver a los archivos ~/.bash_profile, ~/.bash_login y ~./profile y lo lee y ejecuta comandos desde el primero de estos que exista. Usado para la configuracion por default para todos los usuarios cuando empiezan un login shell
- **.bashrc**               archivo individual de un usuario. Es un script de shell que bash corre cuando este es iniciado cuando el usuario se logea, el cual inicia una sesion de shell interactiva. Puedes poner comando aqui para para configurar tu shell a tu gusto con tus ciertas configuraciones. Configuracion especifica para un usaurio aplicado cuando empieza una sub shell
    `ssh user@host "source ~/.bashrc; /path/script.sh"`
- **.bash_history**         es un archivo creado por el bash, el cual almacena una historia de los comandos que el usuario ha ingresado en el prompt/shell/bash usado para ver comandos viejos que han sido previamente ejecutados por el usuario
- **.bash_logout**          su contenido es alimentado por bash, cuando un logeo de bash existe, es muy usado para terminar programas que fueron empezados por .bash_login o - .bash_profile. Por ejemplo si un proceso es empezado en background lo puedes terminar con el .bash_logout

## Shebang - hashbang `#!`

Es la interpreteacion al inicio de un bash script, para decirle al sistema que el script sea interpretado como un script de BASH

**Nota**: Si definimos que el shebang es de bash(o de cualquier otro), el script es ejecutado en la shell de tipo bash(o en la shell que este el shebang) , cargando en memoria un proceso hijo(subshell) para dicho shell, si el script no presenta shebang se creara una subshell del mismo tipo con el que se ejecuto el script

magic byte string being 0x23 0x21, the two-character encoding in ASCII of #!

`#!/bin/sh` – Execute the file using the Bourne shell, or a compatible shell, assumed to be in the /bin directory
`#!/bin/bash` – Execute the file using the Bash shell
`#!/usr/bin/env python` – Execute with a Python interpreter, using the program search path to find it.


## Variables

Son basicamente etiquetas, una especie de nombres usados para representar ciertos valores guardados en alguna parte de la memoria de la computadora.

### global

Globales  son las que eestan disponibles/visibles en toda la shell, es visible para cualquier proceso en ejecucion o que se ejecute desde la shell, ejemmplo
```
env
env | wc -l
export var
env
env | wc l
bash
echo $var
exit
unset var
```
**Nota**: estas al momento de reiniciar el shell se eliminan, hay que guardarlas por default en el path  /$HOME/.bashrc
```
#!/bin/bash
### globals ###
ver=0.3.0
title="Tool ver-$ver"
```
### local

- local     son las variables que solo estan visibles en la shell donde se definio esa variable, por ejemplo

```
var=10
echo $var
bash
echo $var
exit
echo $var
```

```
func ()
{
  local loc_var=23       # Declared as local variable.
  echo                   # Uses the 'local' builtin.
  echo "\"loc_var\" in function = $loc_var"
  global_var=999         # Not declared as local.
                         # Therefore, defaults to global. 
  echo "\"global_var\" in function = $global_var"
}  
```


### local and global
```
#!/bin/bash
# Experimenting with variable scope
var_change () {
local var1='local 1'
echo Inside function: var1 is $var1 : var2 is $var2
var1='changed again'
var2='2 changed again'
}
var1='global 1'
var2='global 2'
echo Before function call: var1 is $var1 : var2 is $var2
var_change
echo After function call: var1 is $var1 : var2 is $var2
```

### Default
Util para casos donde el valor de una variable no puede quedar sin ser definido y se tiene que tener un valor por default.
```
$ ENVIRONMENT="QA"
$ echo "$ENVIRONMENT"
QA

$ ENVIRONMENT="${ENVIRONMENT:-DEV}"
$ echo "$ENVIRONMENT"
DEV
```

### Explicit

Las variables explicitas son las que utilizan el comando `declare` para especificar que tipo de variables son como int, float, double,...
```
declare [-aAfFgilnrtux] [-p] [name[=value] …]
declare -i foo=5+6


$ declare var
$ declare -i int
$ var="1+1"
$ int="1+1"
$ echo "$var"
1+1                 ## The literal "1+1"
$ echo "$int"
2
```

### Implicit
Son las más comunes, no se define su tipo y pueden almacenar cualquier valor númerico o alfanumerico.

```
$ var="1+1"
$ echo "$var"
1+1                 ## The literal "1+1"
```

### Special

- `$0` - The name of the Bash script.
- `$1` - $9 - The first 9 arguments to the Bash script. (As mentioned above.)
- `$#` - How many arguments were passed to the Bash script.
- `$@` - All the arguments supplied to the Bash script.
- `$?` - The exit status of the most recently run process.
- `$$` - The process ID of the current script.
- `$USER` - The username of the user running the script.
- `$HOSTNAME` - The hostname of the machine the script is running on.
- `$SECONDS` - The number of seconds since the script was started.
- `$RANDOM` - Returns a different random number each time is it referred to.
- `$LINENO` - Returns the current line number in the Bash script.


## Command substitution

La salida estandard de un comando puede ser ancapsulada, tanto como un valor puede ser almacenado y entonces ser expandido por la shell. Permite al output(salida) de un comando reemplazar el comando por el mismo.

```
#!/bin/bash

ver=0.3.0
date=`date +%F_%T`
title="====== Tool ver-$ver ======"

echo -e "[$date] $title"

```
```
mkdir $(seq 1 5)
seq 1 5
echo $(seq 1 5)

```
## Expansion

Es la manera en que el bash ejecuta comandos y reemplaza la sustitucion del comando con la salida estandard del comando. Cuando un comando es reemplazado por su salida estandard, esa salida(presumiblemetne solo texto) puede ser asignado a una variable como cualquier otro valor. O sea es cuando tu escribes algo en la shell y este es expandida en algo mas antes de que la shell actue, expandes tu resultado.
```
pathname expansion      ls *.sh
tilde expansion         echo ~
arithmetic expansion    echo $(( 2 + 2 ))
brace expansion         echo text_file_{1..5}.txt
Parameter expansion     echo $USER
```

## COMMENTS
Es la manera en que nosotros ponemos un comentario dentro de nuestro codigo(script) y que no afecta en la ejecucion de la misma, ya que es considerado nulo.

```
################################################
# patchmaster
# Upgrade Tool
#
# Written:        somebody
# Contributors:   someone
# Creation date:  2014/05/09
# Modified date:  2016/11/16
#
################################################
```

## Exit status

Cada comando/instruccion ejecutado en la shell tiene un estado de salida, el cual es un numero entero que describe si el comando ejecutado fue o no ejecutado correctamente. Donde el numero 0 significa que el comando se ejecuto correctamente y desde el 1 al 255 significa comando fallido, el cual se puede ver con el comando   echo $?

  -  0 - Success
  -  1 - Catchall for general errors
  -  2 - Misuse of shell builtins (according to Bash documentation)
  -  126 - Command invoked cannot execute
  -  127 - "command not found"
  -  128 - Invalid argument to exit
  -  128+n - Fatal error signal "n"
  -  130 - Script terminated by Control-C
  -  255\* - Exit status out of range

```
#!/bin/bash
echo "el script se ejecuto correctamente"
exit 0
```
echo $?

exit $variable	= Nombras a que el error de salida te muestre como especificaste en la variable

```
#!/bin/bash
var=10
exit $var
```
## Special Characters

Algunos caracteres son evauluados por bash para no tener un significado literal. En lugar de eso estos especiales poseen una instruccion especial o tienen un significado alternaitvo.

- quoting
`echo this is a               test`
- doble quotes            
`echo "this is a               test"`
- single quotes          
`echo vamos a crear 5 archivos automaticamente text_file_{1..5}.txt`             
`echo 'vamos a crear 5 archivos automaticamente text_file_{1..5}.txt'`
escaping characters     
`echo "mi usuario es $USER"`                                                     
`echo "mi usuario es \$USER"`                                                              
`echo -e "Damos un espacio de tabulador \t y un 5 saltos de linea \n\n\n\n\n"`

## READ
Lee el contenido de una linea y la manda a una variable. Es principalmente usado para tomar la entrada de un usuario al igual que implementar funciones tomando la entrada desde desde la entrada estandard de la shell.
```
#!/bin/bash
echo "escribe una palabra"
read palabra
echo "Tu palabra fue $palabra"
```
`read AWS_ACCESS_KEY_ID`
`read AWS_SECRET_ACCESS_KEY`

## Arithmetic operators
Son las operaciones aritmeticas(matematicas) que realiza bash, y estas son algunas maneras de realizar las operaciones aritmeticas.
### expr
```
#!/bin/bash
 
# Works as string
expr '10 + 30'
 
# Works as string
expr 10+30
 
#Perform the addition
expr 10 + 30
 
#Find out the remainder value
expr 30 % 9
 
#Using expr with backtick
myVal1=`expr 30 / 10`
echo $myVal1
 
#Using expr within command substitute
myVal2=$( expr 30 - 10 )
echo $myVal2
```

### let
```
#!/bin/bash
 
# Multiplying 9 by 8
let val1=9*3
echo $val1
 
# Dividing 8 by 3
let "val2 = 8 / 3"
echo $val2
 
# Subtracting 3 from 9
let val3=9-3
echo $val3
 
# Applying increment
let val4=7
let val4++
echo $val4
 
# Using argument value in arithmetic operation
let "val5=50+$1"
echo $val5
```


### (()) Arithmetic expansion

```
#!/bin/bash
 
# Calculate the mathematical expression
val1=$((10*5+15))
echo $val1
 
# Using post or pre increment/decrement operator
((val1++))
echo $val1
val2=41
((--val2))
echo $val2
 
# Using shorthand operator
(( val2 += 60 ))
echo $val2
 
# Dividing 40 by 6
(( val3 = 40/6 ))
echo $val3
```

### bc
```
#!/bin/bash
 
# Dividing 55 by 3 with bc only
echo "55/3" | bc
 
# Dividing 55 by 3 with bc and -l option
echo "55/3" | bc -l
 
# Dividing 55 by 3 with bc and scale value
echo "scale=2; 55/3" | bc
```


## Arrays
Arrays son unos de los mas usados y fundamentales estructuras de datos. Puedes pensar que un array es una variable que puede almacenar multiples variables dentro de el.

### Caracteristicas
Los indices no deben de ser continuos
los elementos del array no tienen que ser del mismo tipo de dato ya que puede ser una cadena o un numero
No hay limite de numeros maximos de elementos que pueden ser almacenados en un array
Bash no soporta arreglos multidimensionales, el cual no puedes tener elementos del array que tambien son arrays
El index -1   hace referencia al ultimo elemento del array
EL primer elemento del array tiene un indice de 0 y de ahi se empiezan a contar

```
#! /bin/bash
Unix[0]='Debian'
Unix[1]='Red hat'
Unix[2]='Ubuntu'
Unix[3]='Suse'

echo ${Unix[1]}
```
### declare
```
declare -a arrayname=(element1 element2 element3)
declare -a Unix=('Debian' 'Red hat' 'Red hat' 'Suse' 'Fedora')
```
### Print

```
echo ${Unix[@]}

#Length
${#arrayname[@]} 

#Number of character in first element
${#Unix}

#Number of characters in third element
${#Unix[3]} 

#Extraction by offset
Unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux');
${Unix[@]:3:2}

#Extraction with offset and length
Unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux');
echo ${Unix[2]:0:4}

#Search and replace in array
Unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux');
echo ${Unix[@]/Ubuntu/SCO Unix}

#Add an element 
Unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux');
Unix=("${Unix[@]}" "AIX" "HP-UX")

#Remove an element
unset Unix[3]

#Remove using patterns
declare -a Unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora');
declare -a patter=( ${Unix[@]/Red*/} )
echo ${patter[@]}

#Copy an array
Unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux');
Linux=("${Unix[@]}")

#Concat
Unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux');
Shell=('bash' 'csh' 'jsh' 'rsh' 'ksh' 'rc' 'tcsh');

UnixShell=("${Unix[@]}" "${Shell[@]}")

#Delete an array
Unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux');
Shell=('bash' 'csh' 'jsh' 'rsh' 'ksh' 'rc' 'tcsh');

UnixShell=("${Unix[@]}" "${Shell[@]}")
unset UnixShell
```
```
#!/bin/bash
#Load from file to array

filecontent=( `cat "logfile" `)

for t in "${filecontent[@]}"
do
echo $t
done
echo "Read file content!"

```


## Passing variables to scripts
Son valores ya definidos que nosotros le pasamos a los scripts, cuando nosotros pasamos argumentos a nuestro script una posición de parámetro es asignada el cual van desde el $1 al $9. Si hay mas de 9 argumentos entonces el décimo en adelante no pueden ser asignados como $10 etc... 
```
#!/bin/bash
VARIABLE1="hello"

echo -e "This comes from a parameter: $1\n"
echo -e "This comes from a variable: $VARIABLE1\n"
echo -e "These come from parameters:" $@
```


## IF THEN ELSE

**IF **  nos permite hacer decisiones en nuestros scripts de bash, el cual nos permite definir si o no correr una pieza de codigo basada sobre condiciones que podriamos ajustar.
**THEN**   es el que desempeña un set de acciones dado, el cual podriamos decir que si se cumplio el IF, THEN ejecuta ciertas instrucciones.
**ELSE**      Es la decision contraria a IF, que ejecutaria un bloque de codigo basado en la condicion del IF, el cual diria si no se cumplio el IF, entonces ejecuta esto otro.

```
if [ condition ] 
then
	block_of_statements
fi
```

```
#!/bin/bash
age=21
if [ $age -gt 18 ]
then
  echo "You are old enough to drive in most places."
fi
```

### Compare strings
```
#!/bin/bash
name=John
if [ $string = "John" ]
then
  echo "John is here !!!"
fi
```
### if then else
```
if [ condition ] 
then
	block_of_statements
else
	block_of_statements
fi
```
```
#!/bin/bash
total=100
if [ $total -eq 100 ]; then
 echo "total is equal to 100"
else
 echo "total is not equal to 100"
fi
```
### if then elif else
```
if [ condition 1 ]  
then
	block_of_statements 
elif [ condition 2 ] 
then
	block_of_statements
else 
	block_of_statements
fi
```
```
!/bin/bash
total=100
if [ $total -eq 100 ]
then
 echo "total is equal to 100"
elif [ $total -lt 100 ]
then
 echo "total is less than 100"
else
 echo "total is greater than 100"
fi
```
### Nested
```
#!/bin/bash

if [ $# -ne 1 ] 
then
	echo "You need to enter the year."
	exit 1 
fi

year=$1

if [ $[$year % 400] -eq "0" ]
then
	echo "$year is a leap year!" 
elif [ $[$year % 4] -eq 0 ]
then
	if [ $[$year % 100] -ne 0 ]
	then
		echo "$year is a leap year!"
	else
		echo "$year is not a leap year."
	fi
else
	echo "$year is not a leap year."
fi
```
### Multiple condition
```
#!/bin/bash
num=150
if [ $num -gt 100 ] && [ $num -lt 200 ]
then
	echo "The number lies between 100 and 200"
fi
```
## Loops
Es una declaracion en bash que nos permite que el codigo sea repetidamente ejecutado
Estas son instrucciones que se repiten en algun tipo de acciones durante cierto numero de iteraciones, ese numero de iteraciones esta definido por algun tipo de condicion, y siempre que la condicion sea verdadera el bucle continuara iterando atraves de la lista de comandos y los ejecutara.

### for 
Hace todas las repeticiones declaradas en el for y hasta que se completen se termina el for
```
 for dou in {1..3}; do echo "Number $dou ..."; done
```

### while 
Mientras la sentencia que esta en el while se cumpla, se seguira ejecutando el codigo del while
```
#!/bin/bash
        LIMIT_TIME=12
        TIME_INTERVAL=2
        echo -e "\nThis script will run for $LIMIT_TIME Seconds... \n"
        echo -e "Press CTRL+C to exit before the time limit\n"
        while [ "$SECONDS" -le "$LIMIT_TIME" ] 
                do
                        echo "This Script $0 has been running for $SECONDS seconds."
                        sleep $TIME_INTERVAL
                done
```
### until
until  en este loop, hasta que la sentencia se cumpla va a dejar de ejecutar el cuerpo del until y termina el script
```
#!/bin/bash
until [ "$n" = end ]
do
echo "Input end to exit or something else to move on"
read n
echo "Your variabel is ..$n"
done
````
### break
Rompe con la iteracion actual que esta corriendo o el script que esta corriendo y pasa a la siguiente iteracion si es que hay,si no solo termina el script, basicamente solo salta el resto del codigo e ira directamente a la sigueinte iteración
```
#!/bin/bash
UPPER_LIMIT=9
n=0
	while [ "$n" -le $UPPER_LIMIT ]
	do
		n=$(($n+1))
		if [ "$n" -gt 2 ]; then
		break
		fi
echo "$n"
done
```

### continue
Continua de nuevo con la iteracion o con el codigo del script,o sea reinicia de nuevo la iteracion o la ejecucion de los comandos
```
        #!/bin/bash
        UPPER_LIMIT=10
        echo "Numbers 1 to 10 (but not 3 and 7)."
        n=0
        while [ "$n" -le "$UPPER_LIMIT" ]
        do
                n=$(($n+1))
                if [ "$n" -eq 3 ] || [ "$n" -eq 7 ]; then
                        continue
                fi
        echo "$n"
        done
```

## Case

Esta declaracion de bash puede ser usada para probar valores como enteros y cadenas. Case no es un loop ya que no ejecuta un bloque de codigo por un numero N de tiempo , en lugar de eso revisa la condicion y controla el flujo del programa.

```
       #!/bin/bash
        echo -n "Do you agree with this? [yes or no]: "
        read yno
        case $yno in
                [yY] | [yY][Ee][Ss] )   echo "Agreed" ;;
                [nN] | [nN][Oo]   )   echo "Not agreed, you can't proceed the installation"; exit 1 ;;
                *                   )   echo "Invalid input" ;;
                esac
```
 
## Execution Operators
Son los operadores que nos sirven para ser usados en expresiones de las condicionales, la forma mas basica de la estructura del if que prueba una condicion y entonces ejecuta un bloque de codigo si es que la condicion se cumplio
Existen 3 tipos de operadores, los cuales son:

**Operadores de archivo**   son un poderoso set de operadores logicos dentro de bash. 
Operator	Description

| Operators  |Description   |
| ------------ | ------------ |
|-a filename|True if the file exists; it can be empty or have some content but, so long as it exists, this will be true|
|-b filename|True if the file exists and is a block special file such as a hard drive like /dev/sda or /dev/sda1|
|-c filename|True if the file exists and is a character special file such as a TTY device like /dev/TTY1|
|-d filename|True if the file exists and is a directory|
|-e filename|True if the file exists; this is the same as -a above
|-f filename|True if the file exists and is a regular file, as opposed to a directory, a device special file, or a link, among others|
|-g filename|True if the file exists and is set-group-id, SETGID|
|-h filename|True if the file exists and is a symbolic link|
|-k filename|True if the file exists and its "sticky'" bit is set|
|-p filename|True if the file exists and is a named pipe (FIFO)|
|-r filename|True if the file exists and is readable, i.e., has its read bit set|
|-s filename|True if the file exists and has a size greater than zero; a file that exists but that has a size of zero will return false|
|-t fd|True if the file descriptor fd is open and refers to a terminal|   	
|-u filename|True if the file exists and its set-user-id bit is set|
|-w filename|True if the file exists and is writable|
|-x filename|True if the file exists and is executable|
|-G filename|True if the file exists and is owned by the effective group ID|
|-L filename|True if the file exists and is a symbolic link|
|-N filename|True if the file exists and has been modified since it was last read|
|-O filename|True if the file exists and is owned by the effective user ID|
|-S filename|True if the file exists and is a socket|
|file1 -ef file2|True if file1 and file2 refer to the same device and iNode numbers|
|file1 -nt file2|True if file1 is newer (according to modification date) than file2, or if file1 exists and file2 does not|
|file1 -ot file2|True if file1 is older than file2, or if file2 exists and file1 does not|

## Numeric operators
**Operadores numericos**  los operadores numericos hacen la comparacion entre 2 argumentos numericos.

```
[ $num1 -eq $num2 ]	num1 equals num2
[ $num1 -ne $num2 ]	num1 does not equal num2
[ $num1 -lt $num2 ]	num1 is less than num2
[ $num1 -gt $num2 ]	num1 is greater than num2
[ $num1 -le $num2 ]	num1 is less than or equal to num2
[ $num1 -ge $num2 ]	num1 is greater than or equal to num2
```

## No numeric operators
Te habilitan la comparacion de cadenas alfanumericas de caracteres.
```
[ str1 = str2 ]	str1 equals str2
[ str1 != str2 ]	str1 does not equal str2
[ str1 < str2 ]	str1 precedes str2 in lexical order
[ str1 > str2 ]	str1 follows str2 in lexical order
[ -z str1 ]	str1 has length zero (holds null value)
[ -nstr1 ]	str1has nonzero length (contains one or more characters)
```

## Read from files
Es la manera en que nuestro script puede extraer informacion desde un archivo ajeno al script y trabar con esa información.
### file reader
```
#!/bin/bash
file=test.txt
print=`cat $file`
echo $print
```
### command substitution
```
#!/bin/bash
file=$(<test.txt)
echo $file
```

## IFS
### Internal Field Separator
Asi es como la shell utiliza una prueba de reconocer donde estan las fronteras, el valor por defecto es basicamente el caracter de espacio en blanco,que puede ser un espacio un tap o una nueva linea, y es una prueba de valor que puede ser cambiada,  y se puede determiar donde termina y empieza la palabra.

```
#!/bin/bash
        colors1="red-brown-orange"
        colors2="black+yellow+white"
        echo -e "\nEn este ejemplo elimina el dash - para separar los colores"
        IFS=-
                echo $colors1
                echo $colors2
```

```
#!/bin/bash
        colors1="red-brown-orange"
        colors2="black+yellow+white"
         echo -e "\nEn este ejemplo elimina el plus + para separar los colores"
         IFS=+
         echo $colors1
         echo $colors2
```
```
!/bin/bash
        colors1="red::::::::::::::::::brown::::::::orange"
        colors2="black:yellow:white"
        echo -e "\nEn este ejemplo elimina el colon : para separar los colores"
        IFS=:
        echo $colors1
        echo $colors2
```


## Traps and signals
Te permite agarrar señales y ejecutar codigo cuando este ocurre. Por lo que es un comando que se usa para ejecutar un comando cuando la shell recibe cualquier señal
`trap [-lp] [[arg] signal_spec ...]`
`trap [action] [signal]`

|  key | description  |
| ------------ | ------------ |
|-l|It is used to display the list of all signal names with corresponding number|
|-p|It is used to display signal command or trap command for signal_spec.|
|arg|It is used to execute a command when the shell receives the signal(s).|
|signal_spec|It contains signal name or signal number.|


### exit
```
#!/bin/bash
trap 'echo "Listing variables thanks to my trap: m=$m n=$n o-$o"' EXIT
m=1
n=2
o=3
let "sum = $m+$n+$o "
echo "The sum is ... $sum"
```

## Debug

```
#!/bin/bash
# En este script se imrpime lo que esta pasando line por linea con una trampa ciclada para cada linea
trap 'echo "Listing Variables per each line: a = \"$a\""' DEBUG # Declaras la trampa para que imprima cada linea del script a partir de aqui hacia abajo, el contenido de la variable $a(es como un ciclo en la trampa y se acaba hasta que acaba el script)
a=3; line=$LINENO # Declaras la variable $a con el valor de 3 y la variabele line  del numero que tiene la linea gracias a $LINENO
echo " Variable \$a initialized to $a on the line $line" # imprimes el texto en pantalla
let "a *= 2"; line=$LINENO # multiplicas el valor de la variable $a por 2 y reinicias la variable line por el numero de la linea $LINENO
echo " Variable \$a multiplied by 2 on the line $line"   # imprimes el texto en pantalla
```

### set -euxo pipefail

- `-e` exit on first error

- `-u` termina cuando una variable no definida como  $FO0 is accesada

```
#!/bin/bash
 
variable="Hello!!!"

echo $variable
```

```
#!/bin/bash

set -u

echo $variable
```

- `-o` pipefail termina cuando | cualquier | comando | en | un | pipe tiene  exitcode != 0

```
#!/bin/bash

variable=`ps -fea | grep root | cmd | echo "true"`
echo $variable
```
```
#!/bin/bash

set -o pipefail

variable=`ps -fea | grep root | cmd | echo "true"`
echo $variable
```

- `-x` imprime todos los comandos in un script a stderr antes de ejecutarlos - se uso principal es para el debug
```
#!/bin/bash
 
set -x

number_of_files=5

if [[ ! $number_of_files =~ ^[0-9]+$ ]]; then
	echo -e "\n number of files is not set\n"
else 	
	for i in $( seq 1 $number_of_files );do touch text_number_$i.txt;done
fi

```
output:
```
+ number_of_files=5
+ [[ ! 5 =~ ^[0-9]+$ ]]
++ seq 1 5
+ for i in '$( seq 1 $number_of_files )'
+ touch text_number_1.txt
+ for i in '$( seq 1 $number_of_files )'
+ touch text_number_2.txt
+ for i in '$( seq 1 $number_of_files )'
+ touch text_number_3.txt
+ for i in '$( seq 1 $number_of_files )'
+ touch text_number_4.txt
+ for i in '$( seq 1 $number_of_files )'
+ touch text_number_5.txt
```



## Functions and their structures

###  

```
function_name () {
<commands>
}
```
or
```
function function_name {
<commands>
}
```
```
#!/bin/bash
# Basic function
print_something () {
echo Hello I am a function
}
print_something
print_something
```


## Functions with parameters

```
#!/bin/bash
# Passing arguments to a function
print_something () {
echo Hello $1
}
print_something Mars
print_something Jupiter
```


## Nested functions
```
f1 ()
{

  f2 () # nested
  {
    echo "Function \"f2\", inside \"f1\"."
  }

}  

f2  #  Gives an error message.
    #  Even a preceding "declare -f f2" wouldn't help.

echo    

f1  #  Does nothing, since calling "f1" does not automatically call "f2".
f2  #  Now, it's all right to call "f2",
    #+ since its definition has been made visible by calling "f1".

```

## Functions return and exit
```
#!/bin/bash
# Setting a return status for a function
print_something () {
echo Hello $1
return 5
}
print_something Mars
print_something Jupiter
echo The previous function has a return value of $?
```
```
#!/bin/bash
# Setting a return value to a function
lines_in_file () {
cat $1 | wc -l
}
num_lines=$( lines_in_file $1 )
echo The file $1 has $num_lines lines in it.
```
# ACTIVITIES

- Passing Variables to Scripts at the Command Line
    - Create a script that, when run, will accept two command line values as arguments. These arguments should be a username and password and assigned to two variables in the script named appropriately. Finally, echo those values out to the terminal when run to indicate they were read and assigned as expected.

- Create a script that, when run, will display the following environment variables to the console
    - PATH
    - ENV
    - SHELL

- Write a script that runs three commands:

    - Evaluate an arithmetic expression
    - Attempt to remove a file that does not exist in the current directory
    - Evaluate another arithmetic expression
    - Immediately after each command, echo the exit status of that command to the terminal using the appropriate variable to show success and failure exit codes. 

- Write a script intended to iterate through an array called SERVERLIST containing at least four values (server names). Display all four values to the terminal when run.

- Create a simple text file at the command prompt. This file should contain three values - CPU, Memory and Disk space for an imaginary system, all on one line and delimited with a '|' character.

    - Write a script to read that file and prompt the user for the delimiter value. Use that delimiter along with the IFS variable and read those delimited values into three appropriately named variables. Finally, display them with labels, one each per line.

- Write a script that will prompt the user to enter a number between 1 and 3. Capture that number in a variable and then test that variable. Be sure to display the variable and it's value as appropriate within an if/then/else statement where the final statement will display if they did not enter a number between 1 and 3 telling them they failed to follow instructions. Redirect errors from each of the tests to /dev/null (to prevent script errors from showing if text is entered for example).



