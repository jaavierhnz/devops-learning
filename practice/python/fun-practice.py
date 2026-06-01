def par(n):
    if n % 2 == 0:
        return True
    else:
        return False

n = int(input("Enter a number."))
res = par(n)

if res:
    print(f"{n} is even")
else:
    print(f"{n} is odd")

