# Python 3
## Classes, decorators and lambdas


## class
A class is a constructor that allows us to create objects with specific characteristics or have a way of configuring data with the same characteristics.

```python
class dog:
  color = "yellow"

# instantiate a new dog

dog1 = dog()
dog2 = dog()

# this two dogs have the same color
print(dog1.color)
print(dog2.color)

dog2.color = "brown"

# this dog now has brown color
print(dog2.color)

dog.color = "blue"

dog3 = dog()

# beware of the color of this dogs
print(dog1.color)
print(dog2.color)
print(dog3.color)

```

There is a way to generate an initializer object

```python

class dog:
  def __init__(self, color):
    self.color = color
  def bark(self):
    print("barking...")
  def get_color(self):
    return self.color

dog1 = dog("yellow")
dog2 = dog("blue")
dog3 = dog("brown")

print(dog1, dog2, dog3)
print(dog.color) # dog.color does  exists only after the object it's instantiated
print(dog1.color, dog2.color, dog3.color)


dog1.color = "red"
# all dogs are different
print(dog1.color, dog2.color, dog3.color)

print(dog1.get_color(), dog2.get_color(), dog3.get_color())
print(dog1.bark())
```

Notice how methods of constructor class are simply functions, functions here are passed an extra parameter that represents the object, people usually call this `self`
`__init__` function is the responsible for initializing as many objects as we want

## class inheritage

Inheritance is possible in python:

```python
class pet:
  def __init__(self, color, owner):
    self.color = color
    self.owner = owner

class dog:
  def __init__(self, name, bread):
    self.name = name
    self.bread = bread

# this two classes are unrelated

pet1 = pet("brown", "me")
dog1 = dog("cheese", "dog")

print(type(pet1) is pet)
print(type(dog1) is pet, type(dog1) is dog)


class pet:
  def __init__(self, color, owner):
    self.color = color
    self.owner = owner

class dog(pet):
  def __init__(self, name, bread, color, owner):
    pet.__init__(self, color, owner) # notice how you should specify self 
    self.name = name
    self.bread = bread

dog2 = dog("luis", "perro", "yellow", "me")
print(dog2.color, dog2.name, dog2.owner, dog2.bread)
```

A class could be extended beyond classical POO to act more in a functional way, using [Magic methods](https://www.tutorialsteacher.com/python/magic-methods-in-python)

## decorators

Decorators is a way of 


```python

def hello(name):
  print("hello {}".format(name))

def goodbye(name):
  print("goodbye {}".format(name))

hello("foo")
goodbye("foo")

def greeter( func, arg ):
    print("now a message:")
    return func(arg)

print(greeter(hello, "foo"))
print(greeter(goodbye, "foo"))
```

You can always add more functionality using a wrapper inside a function, adding more lines of code, making richer codes.

Python has a way of making this easier by the usage of decorators:


```python
def greeter( func ):
    def wrapper(arg):
        print("now a message:")
        return func(arg)
    return wrapper

@greeter
def hello(name):
  print("hello {}".format(name))

@greeter
def goodbye(name):
  print("goodbye {}".format(name))


hello("foo")    # the same function, but on esteorids
goodbye("foo")    # the same function, but on esteorids
```

Using `@` makes it possible to pass a function inside a wrapper and set it into a new function.
The only requirements are that decorator functions need to return a function.

Notice the steps

```python

def decorate( func ):
    print(" first (we received {}) ".format(func))

    def wrapper(*args):
        print("second (args if any {})".format(args))
        return func()

    return wrapper

@decorate
def function1():
    print("third")

@decorate
def function2():
    print("the end")

function1()
function2()


function1(1,2,3,4)
function2()

``` 

Check how the args are passed through the decorator and the wrapper.

And one last example:

```python
def decorate( message ):
    print(" first (message is {}) ".format(message))

    def wrapper( func ):
        print(" func receivede {}".format(func))

        def wrapper2( *args ):
            print("args {}".format(args))
            return func(*args)
        return wrapper2

    return wrapper

@decorate( "meow" )
def function1(*args):
    print("function 1",args)

@decorate( "gg" )
def function2():
    print("function2")


function1(1,2,3,4)
function2()
```

Here, executing  `decorate("meow")` returns a wrapper that acts as a decorator, we could use this to make it even more customizable.


## class decorators


One final consideration, class can also be decorated:

```python

class Power:
    def __init__(self, func):
        print("initialiizing object with {} function".format(func))
        self._func = func
    def __call__(self, *args):
        func = self._func
        print("executing power of function {}  with args {}".format(func,args))
        return func(*args) ** 2

@Power
def addition(a,b):
    return a + b

@Power
def difference(a,b):
    return a - b

res = addition(1,2)
print(res)

res = difference(6,3)
print(res)
```


When using as a decorator, the class is always initialized and when executed the `__call__` function is executed 


We can in a more complex way, decorate classes:

```python
class Person:
    def __init__(self, name, age):
        print("init from person")
        # we're saving this values for later
        self._name = name
        self._age = age

    def __call__(self, _class):
        # this is the brand new class that we will return, this will we the mix of the Person claass and the decorated class
        class wrapper(_class):
            # we use _class to inherit the decorated class
            def __init__(_self, *args ,**kwargs):
                # we add some attributes to our wrapped _self object
                _self.name = self._name
                _self.age = self._age

                # we initialize _class first with our own _self object
                _class.__init__(_self, *args, **kwargs)

        return wrapper



@Person("Human1", 45)
class Programmer:
    def __init__(self,   language):
        self.language = language

@Person("Human2", 54)
class Artist:
    def __init__(self, art_topic):
        self.art_topic = art_topic

        # notice how we can access age property even when we have did not add it into self
        if self.art_topic == "painting" and self.age < 88:
            self.can_paint = True

res = Programmer("python")
print(res.__dict__)

res = Artist("music")
print(res.__dict__)

res = Artist("painting")
print(res.__dict__, res.can_paint)
```

Notice how the data is passed through the init functions
