B=[]
C=[]
F=[]

b=int(input("Enter the no. of Players playing Basketball "))
for i in range(b):
    rollno=int(input("The Roll number of Player is "))
    B.append(rollno)
print("The Roll no. of Students playing BasketBall")
print(B)

c=int(input("Enter the no. of Players playing Cricket"))
for i in range(c):
    rollno1=int(input("The Roll number of Player is "))
    C.append(rollno1)
print("The Roll no. of Students playing Cricket")
print(C)

f=int(input("Enter the no. of Players playing Football"))
for i in range(f):
    rollno2=int(input("The Roll number of Player is "))
    F.append(rollno2)
print("The Roll no. of Students playing Cricket")
print(F)

def Union(L1,L2):
    union=[]
    for i in L1:
        union.append(i)
    for i1 in L2:
        if i1 not in L1:
            union.append(i1)
    return union

def Inter(L1,L2):
    inter=[]
    for i in L1 and L2:
        if i in L1 and L2:
            inter.append(i)
    return inter

def Differ(L1,L2):
    differ=[]
    for i in L1:
        if i not in L1 or L2:
            differ.append(i)
        return differ

e=Union(C,B)
print("The Union is ",e)

f=Inter(C,B)
print("The Intersection is ",f)

g=Differ(C,B)
print("The Difference is ",g)




