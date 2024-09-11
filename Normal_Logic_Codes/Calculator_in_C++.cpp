#include<iostream>
using namespace std;

class Calculator
{
	public:
	double add(double a, double b)
	{
		return a+b;
	}
	double sub(double a,double b)
	{
		return a-b;
	}
	double mul(double a,double b)
	{
		return a*b;
	}
	double div(double a, double b)
	{
		return a/b;
	}
};

	
int main()
{
	Calculator calc;
	
	double num1,num2;
	
	cout<<"Enter the First Number: "<<endl;
	cin>>num1;
	cout<<"Enter the Second Number: "<<endl;
	cin>>num2;
	
	char op;
	
	cout<<"Enter the Operation to be Performed '+','-','*','/'";
	cin>>op;
	
	switch(op)
	{
		case'+':
		cout<<"Result : "<<calc.add(num1,num2)<<endl;
		break;
		
		case'-':
		cout<<"Result : "<<calc.sub(num1,num2)<<endl;
		break;
		
		case'*':
		cout<<"Result : "<<calc.mul(num1,num2)<<endl;
		break;
		
		case'/':
		cout<<"Result : "<<calc.div(num1,num2)<<endl;
		break;
		
		default:
		cout<<"Invalid Operation";
	}
	return 0;
}