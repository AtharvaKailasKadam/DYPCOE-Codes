#include<iostream>
using namespace std;

void Selection_Sort(int arr[], int Num)
{
	int i=0;
	int j=0;
	int ST=0;
	int temp=0;
	for(i=0;i<Num;i++)
	{
		ST=i;
		for(j=i+1;j<Num;j++)
		{
			if(arr[j]<arr[ST])
			{
				ST=j;
			}
		}
		temp=arr[i];
		arr[i]=arr[ST];
		arr[ST]=temp;
	}
	cout<<"The Array after Sorting is as Follows : "<<endl;

	for(int i=0;i<Num;i++)
	{
		cout<<arr[i]<<" ";
	}
}

int main()
{
	
	int n;
	int i;
	cout<<"Enter the Number of Elements u want to add in the Array : ";
	cin>>n;
	
	int arr[n];
	
	cout<<"Enter the Elements in the Array : ";
	for(i=0;i<n;i++)
	{
		cin>>arr[i];
	}
	
	for(int i=0;i<n;i++)
	{
		cout<<arr[i]<<" ";
	}
	cout<<"";
	Selection_Sort(arr,n);
	return 0;
}