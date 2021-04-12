# Python 3
## Handling Exceptions

Errors are very common topic in programming, we need to make sure that our programs are created to handle errors

## Syntax errors

This is done by accident almost all the time, and are more related to mistyping or error when coding

```python

print("hello world"
print"hello world"

def wrong:
```

These kinds of errors could be fixed by changing code and align with a linting guide.

## logical Errors

These errors are more related to human misunderstanding of the problem to be solved, these are the most difficult problems, we need to pay attention in our programs to avoid this.

```python
def average(a,b):
    return a + b / 2

print(average(2,2)) # should be 2
print(average(20,40)) # should be 30, wtf
```

## Python Built-in Exceptions

Python has a set of Exceptions that are raised when certain violations occured, for example:

| Exception         | Cause of Error                                                 |
|-------------------|----------------------------------------------------------------|
| AssertionError    | Raised when an assert statement fails.                         |
| AttributeError    | Raised when attribute assignment or reference fails.           |
| KeyError          | Raised when a key is not found in a dictionary.                |
| KeyboardInterrupt | Raised when the user hits the interrupt key (Ctrl+C or Delete) |

```python
assert 2 == 4
dict.search
d = {"a":1, "b":2}
d["c"]
```


Python has a way of handling these errors, in case we may need it

```python
try:
    assert 2 == 4
except AssertionError:
    print("this assertion is handled here :) ")

try:
    print(0/0)
except ZeroDivisionError:
    print("we detected an exception, did you try to make forbidden math? >:/ ")


my_books = {"book1": 1, "book2":1, "book3": 2}
try:
    print(my_books["book4"])
except KeyError:
    print("sorry we don't have that book :/ ")


try:
    print(my_books["book3"])
except KeyError:
    print("sorry we don't have that book :/ ")
else:
    print("yes, we got that")
```

We need to specify the kind of exception we need, please think of all the  possible errors that might happen when running your application.

There is a way of handle ALL the exceptions, please be concerned that this might not be a best practice, and sould be used in specific stuff


```python

try:
    open("this_file_does_not_exists",'r')
except Exception as exp:
    print("catched exception:", exp)
``` 

## Handling custom exceptions

There could be some error that are more complex than the actual built in, even when creating a new module or python application, a good practice is to think of a way of creating Custom errors, so new programmers could find easier to handle this errors in their prefered way


Raise could raise an exception:

```python
raise Exception

raise Exception("summary of exception")
```

Exception class accepts a sumary string when initializing

We could create a class for exceptions, inheriting from `Exception`, 

```python
class CustomException(Exception):
    pass

raise CustomException

raise CustomException("summary of excepttion")
```

We can even pass extra information to this class, just remember to use  `__init__` function

```python
class AccessException(Exception):
    def __init__(self, user):
      self.args = ("User {} has no access, please get out".format(user),)

user = "user1"

if user == "user1":
    raise AccessException(user)
```

