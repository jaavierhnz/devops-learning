people = [
    {"name": "Ana", "age": 30},
    {"name": "Luis", "age": 17},
    {"name": "Sol", "age": 25},
]
for person in people:
    if person["age"] >= 18:
        print(f"{person['name']} is an adult.")
    else:
        print(f"{person['name']} is a minor.")
