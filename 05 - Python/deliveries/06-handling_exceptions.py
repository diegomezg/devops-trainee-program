# Create a class with a custom exception named "DOU_Error".
# Create a function that raises that custom exception everytime
# an string has any character which is not a word character.
# Give an explanation to the class about when you should try to handle an exception
# and when not (Examples requiered)
# define Python user-defined exceptions
class DOU_Error(Exception):
    def __init__(self, name, message='Your name is not DOU'):
        self.name = name
        self.message = message
        super().__init__(self.message)


class alpha_error(Exception):
    def __init__(self, word, message='Use only letters'):
        self.word = word
        self.message = message
        super().__init__(self.message)


def fail():
    name = input('Type your name:\n')
    if name != 'DOU':
        raise DOU_Error(name)


fail()


def check_string():
    word = input('Type a string\n')
    cool = False
    for char in word:
        if(char.isalpha()):
            cool = True
        else:
            raise alpha_error(word)
    print('Your string is correct')


check_string()

# You should use try except funciton with code that could crash but the program would still working
# An example could be a get request, you use try to get x data but if there is anythong the except would continue the petition
try:
    r = requests.get(url, params={'s': thing})
except requests.exceptions.RequestException as e:  # This is the correct syntax
    raise SystemExit(e)
