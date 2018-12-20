########## SIMPLE DECORATORS - FIRST-CLASS FUNCTIONS ##########
# Simple decorator example
def run_and_log_result(func, args=""):
    """
    Run given function and log the result
    """
    print("Calling function", func.__name__)

    # Print return value (if any)
    if (func.__doc__ != None):
        print("Documentation for function", func.__name__, "::\n  ", func.__doc__)

    # Call function
    result = func()

    # Print return value (if any)
    if (result != None):
        print("Result:", result)

    return result

# Simple function to pass in
def hello():
    print("hello")
    return "hello"

########## RUNNING A SIMPLE DECORATOR ##########
run_and_log_result(hello)

########## CREATING WRAPPING DECORATORS & USING WITH @ ##########
# Key is to always return a function
def log_result(func):
    def wrapper():
        result = func()
        print(result)
        return result
    return wrapper

########## FUNCTION ALWAYS SURROUNDED BY DECORATOR ##########
@log_result
def goodbye():
    """Function that says goodbye"""
    print("Goodbye!")

goodbye()


########## MORE INFO ##########
## See https://realpython.com/primer-on-python-decorators/