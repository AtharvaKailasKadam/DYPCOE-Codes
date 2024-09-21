print("################# Selection Sort Program ##################")
L1=[]

n=int(input("Enter the Number of Elements to be inserted in the List : "))
for i in range(n):
    Elements=int(input("The Elements in the List are : "))
    L1.append(Elements)
print("The Elements to be Sorted Are as Follows : ")
print(L1)

## The Code(Part) for Selection Sort...
for i in range(n):
    ST=i
    for j in range(i+1,n):
        if L1[j]<L1[ST]:
            ST=j
    L1[i],L1[ST]=L1[ST],L1[i]
            

print("The List After Sorting is : ")
print(L1)