set1 = []
set2 = [2, 3, 4, 5, 6]

def Contain(no):
    for i in range(0, len(set1)):
        if set1[i] == no:
            return i
    return -1

def Insert():
    no = int(input("Enter Element: "))
    index = Contain(no)
    if index == -1:
        set1.append(no)
    else:
        print("Element already present")

def Remove():
    no = int(input("Enter Element: "))
    index = Contain(no)
    if index == -1:
        print("Element not present")
    else:
        del set1[index]

def Union():
    result = []
    for i in set1:
        result.append(i)
    for j in set2:
        if j not in result:
            result.append(j)
    print("Union:", result)

def Intersection():
    result = []
    for i in set1:
        if i in set2:
            result.append(i)
    print("Intersection:", result)

def Difference():
    result = []
    for i in set1:
        if i not in set2:
            result.append(i)
    print("Difference:", result)

def Subset():
    if all(elem in set2 for elem in set1):
        print("set1 is a subset of set2")
    else:
        print("set1 is not a subset of set2")

def menu():
    print("1.Insert\n2.Remove\n3.Contain\n4.Size\n5.Intersection\n6.Union\n7.Difference\n8.Subset")
    while True:
        ch = int(input("Enter Your Choice: "))
        if ch == 1:
            Insert()
        elif ch == 2:
            Remove()
        elif ch == 3:
            no = int(input("Enter Element: "))
            index = Contain(no)
            if index != -1:
                print("Element is found at index:",index)
            else:
                print("Element not found")
        elif ch == 4:
            print("Size of set1:", len(set1))
        elif ch == 5:
            Intersection()
        elif ch == 6:
            Union()
        elif ch == 7:
            Difference()
        elif ch == 8:
            Subset()
        else:
            break

menu()