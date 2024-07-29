
while True:
    a = int(input("enter num 1: "))
    b = int(input("enter num 2: "))

    op = int(input("Select an option:\n1. Add\t2. Sub\t3. Mul\t4. Div\t5. Exit\n"))

    if op == 1:
        print("Sum is:",a+b)
    elif op == 2:
        print("Diff is:", a - b)
    elif op == 3:
        print("Product is:", a * b)
    elif op == 4:
        print("Quotient is:", a / b)
    elif op == 5:
        exit()




print("New updated version")
