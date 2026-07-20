from sample_app.fizzbuzz import fizzbuzz


def test_empty():
    assert fizzbuzz(0) == []


def test_numbers():
    assert fizzbuzz(2) == ["1", "2"]


def test_fizz():
    assert fizzbuzz(3)[-1] == "Fizz"


def test_buzz():
    assert fizzbuzz(5)[-1] == "Buzz"


def test_fizzbuzz():
    assert fizzbuzz(15)[-1] == "FizzBuzz"
