while True:
    try:
        n = int(input("Enter a number: "))
        if n % 2 == 0:
            print(f"{n} is even.")
        else:
            print(f"{n} is odd.")
        break

    except ValueError:
            print("Please enter an integer number.")
