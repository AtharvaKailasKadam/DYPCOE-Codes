#include<iostream>
using namespace std;
int main()
{
	int d1,d2,d3,d4;

	cout<<"Executing the Hamming Code Operation of 7-bits for 'Even Parity'"<<endl;
	cout<<endl;
	cout<<"Enter the First data bit 'D1' :"<<endl;
	cin>>d1;
	cout<<"Enter the Second data bit 'D2' :"<<endl;
	cin>>d2;
	cout<<"Enter the Third data bit 'D3' :"<<endl;
	cin>>d3;
	cout<<"Enter the Fourth data bit 'D4' :"<<endl;
	cin>>d4;
	cout<<endl;

	int p1=NULL;
	int p2=NULL;
	int p3=NULL;

	cout<<"P1 = "<< p1 <<endl;
	cout<<"P2 = "<< p2 <<endl;
	cout<<"D1 = "<< d1 <<endl;
	cout<<"P3 = "<< p3 <<endl;
	cout<<"D2 = "<< d2 <<endl;
	cout<<"D3 = "<< d3 <<endl;
	cout<<"D4 = "<< d4 <<endl;

	if(p1 == NULL)
	{
		int count = 0;
		if(d1 == 1)
		{
			count++;
		}
		else
		{
			count = count;
		}
			if(d2 == 1)
			{
				count++;
			}
			else
			{
				count = count;
			}
				if(d4 == 1)
				{
					count++;
				}
				else
				{
					count = count;
				}
	if(count % 2 != 0)
	{
		p1 = 1;
	}
	else
	{
		p1 = 0;
	}
	}

	if(p2 == NULL)
	{
		int count = 0;
		if(d1 == 1)
		{
			count++;
		}
		else
		{
			count = count;
		}
			if(d3 == 1)
			{
				count++;
			}
			else
			{
				count = count;
			}
				if(d4 == 1)
				{
					count++;
				}
				else
				{
					count = count;
				}
	if(count % 2 != 0)
	{
		p2 = 1;
	}
	else
	{
		p2 = 0;
	}
	}

	if(p3 == NULL)
	{
		int count = 0;
		if(d2 == 1)
		{
			count++;
		}
		else
		{
			count = count;
		}
			if(d3 == 1)
			{
				count++;
			}
			else
			{
				count = count;
			}
				if(d4 == 1)
				{
					count++;
				}
				else
				{
					count = count;
				}
	if(count % 2 != 0)
	{
		p3 = 1;
	}
	else
	{
		p3 = 0;
	}
	}
	cout<<endl;

	cout<<"The Values of the Parity bit Becomes...!"<<endl;
	cout<<"The 'P1' Parity bit Takes D1 D2 and D4. i.e. = D1="<<d1<<" D2="<<d2<<" D4="<<d4<<endl;
	cout<<"P1="<<p1<<endl;

	cout<<"The 'P2' Parity bit Takes D1 D2 and D4. i.e. = D1="<<d1<<" D3="<<d3<<" D4="<<d4<<endl;
	cout<<"P2="<<p2<<endl;

	cout<<"The 'P3' Parity bit Takes D1 D2 and D4. i.e. = D2="<<d2<<" D3="<<d3<<" D4="<<d4<<endl;
	cout<<"P3="<<p3<<endl;

	cout<<endl;
	cout<<"The Final Hamming Code for the Input is:-"<<endl;

	cout<<"P1 = "<< p1 <<endl;
	cout<<"P2 = "<< p2 <<endl;
	cout<<"D1 = "<< d1 <<endl;
	cout<<"P3 = "<< p3 <<endl;
	cout<<"D2 = "<< d2 <<endl;
	cout<<"D3 = "<< d3 <<endl;
	cout<<"D4 = "<< d4 <<endl;

}