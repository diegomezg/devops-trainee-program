# Python 3
## Generators

Generators are a way of creating iterative stuff in python
Python implements a way of using values from an iterator object so it could be consumed only when the user requires it.

```python
it = iter([1,2,3,4])
print( next(it))
print( next(it))
print( next(it))
print( next(it))
print( next(it)) # this raises an exception
```

In this example, iter generates an iterator object that could be consumed each value at a time, after finishing consuming all the values from the iterator the iteration stops.


We could even, generate our own generator function yielding the values we need.

```python
def generator():
    print("one")
    yield 1

    print("two")
    yield 2

    print("three")
    yield 3
    print("the end")


iterator = generator()

print(next(iterator))
print(next(iterator))
print(next(iterator))
print(next(iterator))
```

We can consume the values using `for`:

```python
def generator():
    print("one")
    yield 1

    print("two")
    yield 2

    print("three")
    yield 3

for n in generator():
    print(n)
```

```python
def generator():
    n = 0
    while True:
        yield n
        n += 1

for n in generator():
    print(n)
```

As long as a `return` is not found, the generator could run forever

```python
def generator():
    n = 0
    while True:
        yield n
        n += 1
        if n==50:
            return n

for n in generator():
    print(n)
```

Generators could be implemented in an easier way using class, we just need to raise StopIteration when we would like to stop.

```python
class fibonnacci:
    def __init__(self, num):
        self.num = num
        self.i = 0
        self.x = 0
        self.x1 = 1

    def __iter__(self):
        return self

    def __next__(self):
        if self.i == self.num:
            raise StopIteration("fibonacci has stopped")

        temp  = self.x
        self.x = self.x + self.x1
        self.i += 1
        self.x1 = temp

        return (self.i, self.x)

for i,res in fibonnacci(50):
    print("{}nth value from fibonnacci is: {}".format(i,res))

```

Generators are the principle of [concurrent programming](https://www.educative.io/blog/python-concurrency-making-sense-of-asyncio)

```python
from time import sleep

def doSomething():
    print("[doSomething] hello im running")
    sleep(1)
    yield 1
    print("[doSomething] hello im running again")
    sleep(3)
    yield 2


def func1():
    doObj = doSomething()
    print("\t[func1] hello world, we do something, we wait till the next code is ready to continue our program")
    res = next(doObj)
    print("\t[func1] returned value from intensive operation was: {}".format(res))
    res = next(doObj)
    print("\t[func1] we need to wait that the function returns us something ({}) to continue".format(res))


dofunc = func1()
```

This ping pong yield is the principle of concurrency, keep track of small operations that could be split, so the running time could be smaller


