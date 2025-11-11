day_of_week = input("Enter the day of the week : ").lower()

print(day_of_week)

if day_of_week == "saturday" or day_of_week == "sunday":
    print("bhaisaab weekend chal rha hai!!!")
else:
    print("kam krle baite 9 to 6 ka gulam hai tu!!!")

choice = input("select the operation you want to perform +, -, *, %, /: ")


num1 = int(input("enter first number: "))
num2 = int(input("enter second number: ")) 

if choice == "+":
    print(adition)
    sum = num1 + num2
    print("Sum of 2 num:",sum)

elif choice == "-":
    diff = num1 - num2
    print("diff of 2 num:",diff)


elif choice == "*":
    product = num1 * num2
    print("product of 2 num:",product)

elif choice == "/":
    div = num1 / num2
    print("div of 2 num:",div)

elif choice == "%":
    ramain = num1 % num2
    print("remainder of 2 num:",ramain)

