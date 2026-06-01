with open("names.txt", "w") as f:
    for i in range(3):
        f.write(input("Write a name: "))
        f.write("\n")
with open("names.txt", "r") as f:
    for name in f:
        n = name.strip()
        print(f"Hello {n}.")