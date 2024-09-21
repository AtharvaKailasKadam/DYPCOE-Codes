print("################# Bubble Sort Program ##################")
L1=[]

n=int(input("Enter the Number of Elements to be inserted in the List : "))
for i in range(n):
    Elements=int(input("The Elements in the List are : "))
    L1.append(Elements)
print("The Elements to be Sorted Are as Follows : ")
print(L1)

## The Code(Part) for Bubble Sort..
for i in range(n):
    for j in range(n-1):
        if L1[j]>L1[j+1]:
            L1[j],L1[j+1]=L1[j+1],L1[j]

print("The List After Sorting is : ")
print(L1)