# Python 
##  Python basics

Python as many other languages has a set of statements that make programming possible

## if statements

If statements are used to evaluate conditions to generate paths according to the response.

```python

a = 6 
if a > 3:
  print("number a is bigger than 3")
elif a == 3:
  print(" number a is 3")
else:
  print("number a is smaller than 3")
```

Notice the indentation, this creates the corresponding code blocks.
If statement responds to logical operator `and`, `or`, `not` and could use multiple conditions using elif statement as long as this could be evaluated to `True` or `False` values.

## for statement

This is used for iteration, python unlike some common programming languages uses iterators as a way of looping through values.

```python
for k in range(1,20,2):
  print(k)
```

Some useful iterators are `range`, `zip`, lists, strings, dictionaries, 

## while statement

While is used to execute a code that runs as long as certain conditions are valid.

```python
a = 0
while a<50:
  print(a)
  a += 1

while True:
 print("this never ends")

while True:
  print("this is executed only once")
  break
```

remember to create conditions where the loop could be finish, you can always use `break` statement to break the loop


## create functions

In python we use the reserved word `def` to define functions


```python

def func():
  print("hello I'm a function")


def func2(numb):
  print("hello I'm a function and your number is:", numb)

def func3(numb=6):
  # using default values for the parameter numb
  print("hello I'm a function and your number is:", numb)

func()
func2(333)
func3()
func3(333)

```


