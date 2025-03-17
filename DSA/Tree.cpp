#include <iostream>
#include <vector>
#include <string>

using namespace std;

struct Node {
    string name;
    vector<Node> v;
    int no;
};

void create(Node *root) {
    cout << "Enter Book Name: ";
    cin >> root->name;

    cout << "Enter No of Chapters: ";
    cin >> root->no;

    for (int i = 0; i < root->no; i++) {
        Node chapter;
        cout << "Enter Chapter Name: ";
        cin >> chapter.name;

        cout << "Enter No of Sections in Chapter: ";
        cin >> chapter.no;

        for (int j = 0; j < chapter.no; j++) {
            Node section;
            cout << "Enter Section Name: ";
            cin >> section.name;

            cout << "Enter No of Subsections in Section: ";
            cin >> section.no;

            for (int k = 0; k < section.no; k++) {
                Node subsection;
                cout << "Enter Subsection Name: ";
                cin >> subsection.name;
                section.v.push_back(subsection);
            }

            chapter.v.push_back(section);
        }

        root->v.push_back(chapter);
    }
}

void display( Node &root, int depth = 0) {
    for (int i = 0; i < depth; i++) {
        cout << "  ";
    }
    cout << root.name << endl;
    for ( Node &child : root.v) {
        display(child, depth + 1);
    }
}
int height(Node &root,int hei){
    int max=hei;
    for(Node &child :root.v){
        int h=height(child,hei+1);
        if(max<h){
            max=h;
        }
    }
    return max; 
}

int main() {
    Node book;
    create(&book);
    cout << "\nBook Structure:\n";
    display(book);
    cout<<height(book,0);
    return 0;
}
