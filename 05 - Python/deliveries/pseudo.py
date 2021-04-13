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
def generate():
    newNames = ()
    for i in dicts:
        newNames=newNames+(i.get('name'),)
    yield newNames
namesThree = generate()
print(namesThree.__next__())
