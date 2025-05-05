#include<iostream>
using namespace std;
struct Node
{
	int data;
	Node *left;
	Node *right;
};


Node* InsertNode(Node* root, int no)
{
	if(root==NULL)
	{
		Node* newNode=new Node();
		newNode->data=no;
		newNode->left=NULL;
		newNode->right=NULL;
		return newNode;
	}
	if(no<root->data)
		root->left=InsertNode(root->left,no);
	else
		root->right=InsertNode(root->right,no);
		return root;

}
void search(Node* root, int no)
{
	if(root==NULL)
	{
		cout<<"The BST is Empty : ";
		cout<<"No Element/Node Found : ";
	}
	else
		if(root->data==no)
		{
			cout<<"Element Found";
		}
		else if(no < root->data)
		{
			search(root->left, no);
		}
		else
		{
			search(root->right,no);
		}
}

LongestPathLength(Node* root)
{
	if(root==NULL)
	{
		cout<<"The BST is Empty : ";
	}
	else
	{
		int left=LongestPathLength(root->left);
		int right=LongestPathLength(root->right);
		if(left<right)
		{
			return right+1;
		}
		else
		{
			return left+1;
		}
	}
}

void SwapTree(Node* root)
{
	if(root==NULL)
	{
		cout<<"The BST is Empty : ";
	}
	else
	SwapTree(root->left);
	SwapTree(root->right);
	Node* temp=root->left;
	root->left=root->right;
	root->right=temp;
}

void FindMin(Node* root)
{
	if(root==NULL)
	{
		cout<<"The BST is Empty : ";
	}
	else if(root->left==NULL)
	{
		cout<<"The Minimum is  : "<<root->data<<endl;
	}
	else 
	{
		FindMin(root->left);
	}
}
void Inorder(Node* root)
{
	if(root==NULL)
	{
		return;
	}
	Inorder(root->right);
	cout<<root->data<<"";
	Inorder(root->left);
}

int main()
{
	Node* root=NULL;
	int no;
	int choice;
	while(true)
	{
		cout<<"Enter the Choice : ";
		cout<<"1. Insert Node : "<<endl;
		cout<<"2. Search Node : "<<endl;
		cout<<"3. Longest Path Length : "<<endl;
		cout<<"4. Swap Tree : "<<endl;
		cout<<"5. Find Minimum : "<<endl;
		cout<<"6. Inorder Traversal : "<<endl;
		cout<<"7. Exit : "<<endl;
		cin>>choice;
		switch(choice)
		{
			case 1:
				cout<<"Enter the Element to be Inserted : ";
				cin>>no;
				root=InsertNode(root,no);
				break;
			case 2:
				cout<<"Enter the Element to be Searched : ";
				cin>>no;
				search(root,no);
				break;
			case 3:
				LongestPathLength(root);
				break;
			case 4:
				SwapTree(root);
				break;
			case 5:
				FindMin(root);
				break;
			case 6:
				Inorder(root);
				break;
			case 7:
				exit(0);
			default:
				cout<<"Invalid Choice : ";
		}
	}
	return 0;
}