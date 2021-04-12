# Python 3
## Python objects (mutable/inmutable) and built-in types (tuples, lists, dictionaries)


## Python syntax

Python has a set of rules that are thought to make programming more efficient and readable, according to the [zen of python](https://www.python.org/dev/peps/pep-0020/)


It's really important to get on these rules to make python scripts in a pythonistic way, reusable, and maintainable.


Some syntax rules are:

- identation: white space identation is used to structure block of codes, this should remain consistent throught all the block code
- strings could be creating using `"` or `'` but it should be consistent throught all the string
- python has some reserved words that should never be used as variable names
- comments are created using `#` or `"""  comments """` for multiline comments

If you want to check your python script syntax, you could install a python linter module:

```bash
pip install flake8
flake8 script.py
```

## Python variables and objects

Creating variables in python is just as easy as:

```python
variable = 1234
name = "John Doe"
age = 33.333
```

The type for the variable it's assigned in the creation of the variable, there is no need for type specification 

Everything in python is an object in memory that represents an state in a logical way.

```bash
>>> type(1)
<class 'int'>
>>> type("asdf")
<class 'str'>
>>> type(3.3)
<class 'float'>
>>> type([])
<class 'list'>
>>> type({"a":1})
<class 'dict'>
>>> type((1,2))
<class 'tuple'>
```

From a deep perspective variables are just pointers as in C, so we must keep this in mind when using variables to avoid some memory problems, for example:

```python
a = [1, 2, 3]
b = a

b.append(4)  # b must be now [1, 2, 3, 4]
print(b) # [1, 2, 3, 4]
print(a) # [1, 2, 3, 4] b has also changed
```

## Built in types 

For more information you can check [Built-in Types](https://docs.python.org/3/library/stdtypes.html)

- numeric types

You can do math with this

int, float, complex

```bash
>>> type(3.4)
<class 'float'>
>>> type(3)
<class 'int'>
>>> type(3.0)
<class 'float'>
>>> type(complex(2,3))
<class 'complex'>
>>> complex(2,3)
(2+3j)
>>> type(10j)
<class 'complex'>
```

- strings

You can do text stuff with this 


```bash
>>> type("hello world")
<class 'str'>
>>> type("123456")
<class 'str'>
>>> type('123456')
<class 'str'>
>>> type("""
... asdfsdfsdF
... Sdfsdfsdfs
... """)
<class 'str'>
>>> type("""
... multiline string
... """)
<class 'str'>
```

- bytes

You can do binary operations with this


```bash
>>> bytes(5)
b'\x00\x00\x00\x00\x00'
>>> bytes(1)
b'\x00'
>>> bytes(0)
b''
```

- boolean

Just `True` or  `False` 


- list

Lists are object that could contain anything and could be referred using indexes


```bash
>>> a=[1,2,3,4]
>>> a[0]
1
>>> a[1]
2
>>> a[-1]
4
>>> a[-2]
3
```

There is even a way to get values faster for a list, using slices


[Python List Slicing](https://www.geeksforgeeks.org/python-list-slicing/)

List slicing also works with strings


- tuples

Tuples are a type of object similar to lists that could store any kind of data, but once it's created they cannot modify its internal structure
Use this when sure your data structure it's not going to change.
Slicing also works on sets



```bash
>>> a = (1,2,3,4)
>>> a
(1, 2, 3, 4)
>>> type(a)
<class 'tuple'>
>>> a[0] = 6
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'tuple' object does not support item assignment
>>> a[4] = 6
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'tuple' object does not support item assignment
>>> a[0]
1
>>> a[1]
2
```

- dictionaries

Dictionaries are objects that could store any kind of object using custom keys as indexes.


```bash
>>> a[0]
1
>>> a[1]
2
>>> a = {"tree": "apple", "age": 6, "data": {1:2}}
>>> a
{'tree': 'apple', 'age': 6, 'data': {1: 2}}
>>> a["age"]
6
>>> a["data"]
{1: 2}
>>> a["data"][1]
2
>>> a["new_key"] = 6
>>> a
{'tree': 'apple', 'age': 6, 'data': {1: 2}, 'new_key': 6}
```
## builtin functions

Python has a set of native functions that could be used without importing external modules.
For example:

- math

| Function | Description                                                         |
|----------|---------------------------------------------------------------------|
| abs()    | Returns absolute value of a number                                  |
| divmod() | Returns quotient and remainder of integer division                  |
| max()    | Returns the largest of the given arguments or items in an iterable  |
| min()    | Returns the smallest of the given arguments or items in an iterable |
| pow()    | Raises a number to a power                                          |
| round()  | Rounds a floating-point value                                       |
| sum()    | Sums the items of an iterable                                       |

- type conversion

| Function  | Description                                                          |
|-----------|----------------------------------------------------------------------|
| ascii()   | Returns a string containing a printable representation of an object  |
| bin()     | Converts an integer to a binary string                               |
| bool()    | Converts an argument to a Boolean value                              |
| chr()     | Returns string representation of character given by integer argument |
| complex() | Returns a complex number constructed from arguments                  |
| float()   | Returns a floating-point object constructed from a number or string  |
| hex()     | Converts an integer to a hexadecimal string                          |
| int()     | Returns an integer object constructed from a number or string        |
| oct()     | Converts an integer to an octal string                               |
| ord()     | Returns integer representation of a character                        |
| repr()    | Returns a string containing a printable representation of an object  |
| str()     | Returns a string version of an object                                |
| type()    | Returns the type of an object or creates a new type object           |

- input/output

| Function | Description                                    |
|----------|------------------------------------------------|
| format() | Converts a value to a formatted representation |
| input()  | Reads input from the console                   |
| open()   | Opens a file and returns a file object         |
| print()  | Prints to a text stream or the console         |



## Object mutability

object mutability means that an object could be changed after it is innitialized.

[Mutable vs Immutable Objects in Python]( https://medium.com/@meghamohan/mutable-and-immutable-side-of-python-c2145cf72747)

built in types are inmutable by nature.
 
in summary:

- Mutable objects:
list, dict, set, byte array

- Immutable objects:
int, float, complex, string, tuple, frozen set [note: immutable version of set], bytes

