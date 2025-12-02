def remove_duplicates(s):
    unique = ""
    for ch in s:
        if ch not in unique:
            unique += ch
    return unique

user_str = input("Enter a string: ")
result = remove_duplicates(user_str)
print("Unique string:", result)
