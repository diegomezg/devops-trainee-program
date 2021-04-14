# create two classes that represents an abstract form
class student:
    def __init__(self, name, grade, tag):
        self.name = name
        self.grade = grade
        self.id = tag

    def change_name(self, name):
        student.name = name
        return student.name

    def change_grade(self, grade):
        student.grade = grade
        return student.grade

    def change_id(self, id):
        student.id = id
        return student.id


class homework:
    def __init__(self, title, topic, grade):
        self.title = title
        self.topic = topic
        self.grade = grade

    def change_title(self, title):
        homework.title = title
        return homework.title

    def change_topic(self, topic):
        homework.topic = topic
        return homework.topic

    def change_grade(self, grade):
        homework.grade = grade
        return homework.grade


# with at least 3 parameters and methods
# initialize some objects from this classes
estudianteUno = student('diego', 8, 17310120)
estudianteDos = student('alex', 6, 17310121)
estudianteTres = student('luis', 2, 17310122)
tareaUno = homework('tarea uno', 'chemistry', 100)
tareaDos = homework('tarea dos', 'math', 80)
tareaTres = homework('tarea tres', 'grammar', 90)
# use one magic method
print(str(tareaUno.grade))
# create a function decorator and a class decorator, try to make something useful


def auth(validate):
    def success(*args):
        result = validate(*args)
        return result
    return success


@auth
def sysinit(passsword):
    if(passsword == 1234):
        return 'Correct credentials'


final = sysinit(1234)
print(final)


# class decorator
class Power(object):
    def __init__(self, arg):
        self._arg = arg
    # somthing like pow(a*b,2)

    def __call__(self, a, b):
        retval = self._arg(a, b)
        return retval ** 2

# pow decorator


@Power
def multiply_together(a, b):
    return a * b


pow_result = multiply_together(2, 2)
print(pow_result)
