# create a generator
def char_counter(word):
    cont = 0
    for char in word:
        cont +=1
    yield cont

result=char_counter('hello')
print(result.__next__())