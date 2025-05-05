#include<iostream>
using namespace std;

struct Node{
    string name;
    Node *a[10];
    int no;
};
Node *root=nullptr;

void createTree(){
    string name;
    int no;
    cout<<"Enter Book Name";
    cin>>name;
    cout<<"Enter Total Chapter:";
    cin>>no;
    Node *newNode = new Node();
    newNode->name=name;
    newNode->no=no;
    root=newNode;
    for( int i=0;i<root->no;i++){
    cout<<"Enter Chapter Name";
    cin>>name;
    cout<<"Enter Total Section:";
    cin>>no;
    Node *newNode = new Node();
    newNode->name=name;
    newNode->no=no;
    root->a[i]=newNode;   
    
    for(int j=0;j<root->a[i]->no;j++){
    cout<<"Enter Section Name";
    cin>>name;
    cout<<"Enter Total Sub-Section:";
    cin>>no;
    Node *newNode = new Node();
    newNode->name=name;
    newNode->no=no;
    root->a[i]->a[j]=newNode;   
    
        for(int k=0;k<root->a[i]->a[j]->no;k++){
    cout<<"Enter Section Name";
    cin>>name;
    Node *newNode = new Node();
    newNode->name=name;
    newNode->no=0;
    root->a[i]->a[j]->a[k]=newNode;   
    
    }
    
    
    }
    
    }
}

void displayTree() {
    if (root == nullptr) {
        cout << "No Book Data Available.\n";
        return;
    }

    cout << "\nBook Name: " << root->name << endl;
    for (int i = 0; i < root->no; i++) {
        cout << "  Chapter: " << root->a[i]->name << endl;
        for (int j = 0; j < root->a[i]->no; j++) {
            cout << "    Section: " << root->a[i]->a[j]->name << endl;
            for (int k = 0; k < root->a[i]->a[j]->no; k++) {
                cout << "      Subsection: " << root->a[i]->a[j]->a[k]->name << endl;
            }
        }
    }
}


int main() {
    int choice;
    do {
        cout << "\nMenu\n";
        cout << "1. Create Book Tree\n";
        cout << "2. Display Book Tree\n";
        cout << "3. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;

        switch (choice) {
            case 1:
                createTree();
                break;
            case 2:
                displayTree();
                break;
            case 3:
                cout << "Exiting Program.\n";
                break;
            default:
                cout << "Invalid Choice. Try again.\n";
        }
    } while (choice != 3);

    return 0;
}