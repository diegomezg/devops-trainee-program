# Create at least 5 unit tests based on any of the excercies listed in the other modules.
# At least one of the unit test should have positive and negative case scenario.
# An explanation to all the class on why you did the tests like that.
import unittest
from unittest import result
import generator
import fibonacci
import pseudo


class DOU_test(unittest.TestCase):
    def test_1(self):
        print('In init')
        self.assertEqual(True, True)
# Verify the function does not return an empty object

    def test_char_lenght(self):
        result = generator.char_counter('hello')
        number = (result.__next__())
        self.assertNotEqual(number, 0)
# Verify the result works propertly

    def test_fibonacci(self):
        number = 2
        result = fibonacci.fibonacci(number)
        self.assertEqual(len(result), number)
# Verify the function generate the same items

    def test_items(self):
        ideal = [0, 1]
        result = fibonacci.fibonacci(2)
        self.assertEqual(ideal, result)
# Verify the result is not empty

    def test_tuple(self):
        result = pseudo.listtotuple()
        self.assertNotEqual(result, 0)
# Verify the string returned is the same as expected

    def test_conditional(self):
        result = pseudo.kun_function('bird')
        if result == 'bird kun':
            assert True
        else:
            assert False


unittest.main()
