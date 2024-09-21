// Write a Program to print the Pattern
// 1111111
// 222222
// 33333
// 4444
// 555
// 66
// 7
#include<iostream>
#include<conio.h>
using namespace std;

int main()
{
	cout<<"Hello Atharva...!"<<endl;
	int n;
	cout<<"Enter the value for the 'n' : ";
	cin>>n;
	int i=0;
	int j;
	
	for(i=1;i<=n;i++)
	{
		for(j=i;j<n;j++)
		{
			cout<<i;
		}
		cout<<i<<endl;
	}
	
	return 0;
}
