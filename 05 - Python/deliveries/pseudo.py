# List of dictionaries
dicts = [
    {"name": "Tom", "age": 10},
    {"name": "Mark", "age": 5},
    {"name": "Pam", "age": 7},
    {"name": "Dick", "age": 12}
]
names = ()
# Generate a tuple using dicts key 'name' with common loop
for i in dicts:
    names = names + (i.get('name'),)
print(names)
# Generate the same tuple with comprehension list
namesTwo = tuple(i.get('name') for i in dicts)
print(namesTwo)

# Transform that list of comprenhention into a generator and consume it.


def tupleKeyName():
    newNames = ()
    for i in dicts:
        newNames = newNames+(i.get('name'),)
    yield newNames

#Call the generator
namesThree = tupleKeyName()
print(namesThree.__next__())

# Based on this object
lista = ['elefante', 'rana', 'jirafa', 'perro', 'puerco', 'tigre']
#Create a function using lambda and filter that creates a list
#with all the strings that contains at least one "a"
filterList= list(filter(lambda word:('a' in word),lista))
print(filterList)

#Create a function using map that creates a new list with the same string 
#but adding " kun" at the end.
#animal is the element of the iterable object
def kun(animal):
    #cat kun to string element
    return animal+' kun'
# define a return object called kun, called kun function and send iterable object
kun=map(kun,lista)
print(list(kun))

#Write an explanation of why reduce is not totally recommended in python 3
