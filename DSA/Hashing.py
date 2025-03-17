def hash_function(l,key):
   length=l-1
   newLength=0
   while(length!=0):
      length=length//10
      newLength+=1
        
   key = pow(key,2)
   newStr=str(key)
   mid = len(newStr)//2

   return int(newStr[mid-newLength+1:mid+1])
   
   
   
def menu():

 n=int(input("Enter Size of array"))
 arr=[None for i in range(0,n)]
 print("##############Menu%%%%%%%%%%%%%")
 while True:
   print("\n 1.add \n2.search \n press any key to exit")
   ch=int(input("Enter Choice:"))
   if ch==1:
      key = int(input("Enter Element "))
      i = hash_function(len(arr),key)
      print(i)
      if arr[i]==None:
          arr[i]=key
      else:
          print("collision occur")
          
   
   elif ch==2:
      key = int(input("Enter Element "))
      i = hash_function(len(arr),key)
      if(arr[i]==key):
         print("Element found")
      else:
         print("Element not found")
      
      
          
