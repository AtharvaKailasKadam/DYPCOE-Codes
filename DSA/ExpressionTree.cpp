#include<iostream>
using namespace std;
class node 
{
public:
	char value;
	node* leftNode;
	node* rightNode;
	node* next = NULL;
	node(char c)
	{
		this->value = c;
		leftNode = NULL;
		rightNode = NULL;
	}
	node()
	{
		leftNode = NULL;
		rightNode = NULL;
	}
	friend class Stack;
	friend class expression_tree;
};
class Stack {
	node* head = NULL;

public:
	void push(node*);
	node* pop();
	friend class expression_tree;
};
class expression_tree 
{
public:
	void postorder(node* x)
	{
		if (x == NULL)
			return;
		else
		{
			postorder(x->leftNode);
			postorder(x->rightNode);
			cout << x->value<< " ";
		}
	}
			
	void preorder(node* x)
	{
		if (x == NULL)
			return;
		else
		{
			cout << x->value << " ";
			preorder(x->leftNode);
			preorder(x->rightNode);
		}
	} 
	void inorder(node* x)
	{
		if (x == NULL)
			return;
		else 
		{
			inorder(x->leftNode);
			cout << x->value << " ";
			inorder(x->rightNode);
		}
	}
};

void Stack::push(node* x)
{
	if (head == NULL) 
	{
		head = x;
	}
	else {
		x->next = head;
		head = x;
	}
}
node* Stack::pop()
{
	node* p = head;
	head = head->next;
	return p;
}
int main()
{
	string s = "ABC*+D/";
	
	Stack e;
	expression_tree a;
	node *x, *y, *z;
	int l = s.length();
	for (int i = 0; i < l; i++) 
	{
		
		if (s[i] == '+' || s[i] == '-' || s[i] == '*' || s[i] == '/' || s[i] == '^') 
		{
			z = new node(s[i]);
			x = e.pop();
			y = e.pop();
			z->leftNode = y;
			z->rightNode = x;
			e.push(z);
		}
		else 
		{
			z = new node(s[i]);
			e.push(z);
		}
	}
	cout << " The Postorder Expression is as Follows : " <<s;
	cout << " \n The Inorder Traversal of Expression Tree: ";
	a.inorder(z);
	cout << "";
	
	
	cout << " \n The Preorder Transversal of Expression Tree: ";
	a.preorder(z);
	cout << "";
	
	cout << " \n The Postorder Transversal of Expression Tree: ";
	a.postorder(z);
	cout << "\n";
	return 0;
}