# Logic to Find the Calculations on the List
# Just to Understand the Logic for the Following Operations
List1=[]
n=int(input("Enter the Number of Values to be Entered in the List : "))
print("The Total number of Elements in the List will be : ")
print(n)

for i in range(n):
    Elements=int(input("Enter the Element : "))
    List1.append(Elements)

print("The List is as Follows : ")
print(List1)

# Maximum Number....
print("The Maximum Element in the List is : ")
temp=0
for i in List1:
    if(i>temp):
        temp=i
print(temp)

# Minimum Number....
print("The Minimum Element in the List is : ")
temp1=1000
for i in List1:
    if(i<temp1):
        temp1=i
print(temp1)

#Total Number of Elements....
print("The Total Number of Elements in the List is : ")
count=0
for i in List1:
    count=count+1
print(count)

# The Sum of All the Elements....
print("The Total Sum of Elements in the List is : ")
sum1=0
for i in List1:
    sum1=sum1+i
print(sum1)

# The Average of all the Elements in the List....
print("The Average of the Elements in the List is :")
sum=0
for i in List1:
    sum=sum+i
average=sum/n
print(average)

print("The Code Executed Successfully....!")
