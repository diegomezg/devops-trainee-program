# Python 3
## Pseudo-functional python

Python is a complete language that could be used in many useful ways, with different language paradigms

[more about programming paraadigms](https://en.wikipedia.org/wiki/Programming_paradigm)

- Functional paradigm

This means that the programming is intended to work only with functions, using functions as a black boxes with inputs and outputs

- Object oriented paradigm

There is some storage on objects that could be used to share data and have a logical structure of the data and the outputs


Python could be used in both ways, there is no preferred way, so it's important to know both.

## functional paradigm

Python functions are created in this way:

```python
def func_name(arg1, arg2, arg3):
  print("argument 1 is: ", arg1)
  print("argument 2 is: ", arg2)
  print("argument 3 is: ", arg3)
  return [arg1, arg2, arg3]

b = func_name(1, 2, 3) 
print(b)
``` 

python functions have:
- the reserved word `dev`
- a function name
- arguments specification
- function body that may or not contain a `return` section, this is indented.

Python also has a way of creating small anonymous functions called lambda functions, which have only one expression, this is useful for performing simple operations.

```python
func_name = lambda arg1, arg2, arg3 : arg1 + arg2 + arg3
print(func_name(1,2,3))
```

Lambda functions:
- start with the reserved word `lambda`
- contains args specification, `:`
- contains a simple expression that will be returned

Common implementations for funcional programming includes:

Map function, that executes a function on all the elements of a list or iterable object

```python
l = [1, 2, 3, 4]
m = list(map(lambda x: 2*x, l))
print(m)
```

Filter function, that filters a list, using a lambda function executing on each element, checking if this is True or False

```python
l = [0,1,2,3,4]
m = list(filter(lambda x: x>2, l))
print(m)
```

Reduce, this is not a native function anymore, but you can import it and use it
Reduce function executes a function using: 
 
```python
from functools import reduce
l = [1, 2, 3, 4]
m = reduce(lambda x,y: x+y,[1,2,3,4])
print(m)
```

Even more, python has a way of common operations for the creation of iterative objects

List comprehension

In a traditional way, you can create a list:

```python
numbers = []
for i in range(100):
  numbers.append(i)

print(numbers)
```
Using an empty list and a for iteration, you could fill a list with numbers.
Python has a comprehensive way of making this:

```python
numbers = [ i for i in range(100) ]
print(numbers)
```

list comprehension has this structure `[  < RETURNN VALUE >  for <X> in <ITERATIVE>  ]`
- the return value it's a value that it's going to be return as element in the list, this could be any operation, normally we use the iterative variable 
- X in this case is the iterative variable, this will change its value throught all the loop
- ITERATIVE its an iterative object that could be a range, a list, a str, etc

Sometimes we would like to use a list but with a conditional:

```python
evens = []

for i in range(100):
  if i%2 == 0:
    evens.append(i)

print(evens)
```

In a list comprehension form:

```python
evens = [x for x in range(100) if x%2 == 0 ]
print(evens)
```

Where you have the conditional operator on the right side, beside the for iterator
