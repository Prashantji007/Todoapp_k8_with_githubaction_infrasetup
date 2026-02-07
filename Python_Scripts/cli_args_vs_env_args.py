import sys
import os

def addition(num1, num2): # function definition
    return num1 + num2


def subtraction(num1, num2):
    return num1 - num2
 

def multiplication(num1, num2):
    return num1 * num2


num1 = float(sys.argv[1])
operation = sys.argv[2]
num2 = float(sys.argv[3])

if operation == "add":
    output = addition(num1, num2)
    print("Addition:", output)

elif operation == "sub":
    output = subtraction(num1, num2)
    print("Subtraction:", output)

elif operation == "mul":
    output = multiplication(num1, num2)
    print("Multiplication:", output)

else:
    print("Invalid operation. Please use 'add', 'sub', or 'mul'.")

print(os.getenv("tree")) # fetching environment variable for senstive data like passwords, api keys etc.
