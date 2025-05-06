#include <iostream>
#include <string>

using namespace std;

struct Node {
    char data;
    Node *left;
    Node *right;
};

Node* s[10];
int top = -1;

void ExpressionTree(string str) {
    for (int i = 0;i<str.length();i++)
{
        if (str[i] == '+' || str[i] == '-' || str[i] == '*' || str[i] == '/') {
            Node* n1 = s[top--];
            Node* n2 = s[top--];
            Node* newNode = new Node();
            newNode->data = str[i];
            newNode->left = n1;
            newNode->right = n2;
            s[++top] = newNode;
        } else {
            Node* newNode = new Node();
            newNode->data = str[i];
            newNode->left = nullptr;
            newNode->right = nullptr;
            s[++top] = newNode;
        }
    }
}

void Display(Node* root) {
    if (root == nullptr) {
        cout << "Empty Tree" << endl;
        return;
    }

    Node* stack1[20];
    Node* stack2[20];
    int top1 = -1, top2 = -1;

    stack1[++top1] = root;

    while (top1 != -1) {
        Node* temp = stack1[top1--];
        stack2[++top2] = temp;

        if (temp->left)
            stack1[++top1] = temp->left;
        if (temp->right)
            stack1[++top1] = temp->right;
    }

    while (top2 != -1) {
        cout << stack2[top2--]->data << " ";
    }

    cout << endl;
}

int main() {
    cout << "The Expression Tree is: " << endl;
    cout << "ab+cde+**"<<endl;
    ExpressionTree("ab+cde+**");
    cout << "The Postfix Expression is: " << endl;
    Display(s[0]);
}
