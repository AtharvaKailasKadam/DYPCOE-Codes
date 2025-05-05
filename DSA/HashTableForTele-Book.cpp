#include<iostream>
using namespace std;

struct Node
{
    string name;
    int no;
    Node *a[10];
};
Node *root=nullptr;

void CreateTree()
{
    string name;
    int no;
    cout<<"Enter the name of the Book: ";
    cin>>name;
    cout<<"Enter the Number: ";
    cin>>no;
    Node *newNode = new Node();
    newNode->name = name;
    newNode->no = no;
    root=newNode;
    for(int i=0;i<root->no;i++)
    {
        cout<<"Enter the Chapter Name: ";
        cin>>name;
        cout<<"Enter the No. of Chapters: ";
        cin>>no;
        Node *newNode = new Node();
        newNode->name = name;
        newNode->no = no;
        root->a[i]=newNode;

        for(int j=1;j<root->a[i]->no;j++)
        {
            cout<<"Enter the Sub-Chapter Name: ";
            cin>>name;
            cout<<"Enter the No. of Sub-Chapters: ";
            cin>>no;
            Node *newNode = new Node();
            newNode->name = name;
            newNode->no = no;
            root->a[i]->a[j]=newNode;

            for(int k=0;k<root->a[i]->a[j]->no;k++)
            {
                cout<<"Enter the Sub-Sub-Chapter Name: ";
                cin>>name;
                cout<<"Enter the No. of Sub-Sub-Chapters: ";
                cin>>no;
                Node *newNode = new Node();
                newNode->name = name;
                newNode->no = no;
                root->a[i]->a[j]->a[k]=newNode;
            }
        }
    }
}

void DisplayTree()
{
    if(root==nullptr)
    {
        cout<<"The Tree is Empty : ";
        return;
    }
    cout<<"The Book Name is: "<<root->name<<endl;
    for(int i=0;i<root->no;i++)
    {
        cout<<"the Chapter is "<<root->a[i]->name<<endl;
        for(int j=0;j<root->a[i]->no;j++)
        {
            cout<<"The  Sub-Chapter is "<<root->a[i]->a[j]->name<<endl;
            for(int k=0;k<root->a[i]->a[j]->no;k++)
            {
                cout<<"The Sub-Sub-Chapter is "<<root->a[i]->a[j]->a[k]->name<<endl;
            }
        }
    }
}

int main()
{
    int choice;
    while(true)
    {
        cout<<"1. Create Tree"<<endl;
        cout<<"2. Display Tree"<<endl;
        cout<<"3. Exit"<<endl;
        cout<<"Enter your choice: ";
        cin>>choice;
        switch(choice)
        {
            case 1:
                CreateTree();
                break;
            case 2:
                DisplayTree();
                break;
            case 3:
                exit(0);
            default:
                cout<<"Invalid choice"<<endl;
        }
    }
    return 0;
}