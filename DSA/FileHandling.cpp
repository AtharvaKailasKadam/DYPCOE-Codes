#include<iostream>
#include<fstream>
using namespace std;
class FileHandling
{ 
    int Rollno;
    string Name, Phone, Address;

    public:
    void adddata()
    {
        fstream f;
        f.open("Student.txt",ios::in);
        cout<<"Enter the Roll Number:"
        cin>>Rollno;
        int roll;

        while(!f.eof())
        {
            f>>Roll>>Name>>Phone>>Address;
            if(Rollno==roll)
            {
                cout<<"Roll Number already exists"<<endl;
                break;
            }
        }
        f.close();

        f.open("Student.txt"ios::app);
        cout<<"Enter the Roll Number:";
        cin>>Rollno;
        cout<<"Enter the  Name:";
        cin>>Name;
        cout>>"Enter the Phone Number:";
        cin<<Phone;
        cout>>"Enter the Address:";
        cin<<Address;
        f<<Rollno<<Name<<Phone<<Adress<<endl
        f.close();
        return 0;
    }

    void RemoveData()
    {
        fstream f,f1;
        f.open("Student.txt",ios::in);
        f1.open("temp.txt",ios::app);
        int Roll;
        cout<<"Enter the Roll Number to be Deleted:";
        cin>>Roll;
        while(!f.eof())
        {
            f>>RollNo>>Name>>Phone>>Address;
            if(Rollno==Roll)
            {
                f1<<RollNo<<Name<<Phone<<Address<<endl;
            }
        }
        remove("Student.txt");
        rename("temp.txt","Student.txt");
        cout<<"Record Deleted Successfully"<<endl;
        f.close();
    }

    void DisplayData()
    {
        fstream f;
        f.open("Student.txt",ios::in);
        cout<<"Roll Number / Name / Phone Number / Address"<<endl;
        while(!f.e0f())
        {
            f>>RollNo>>Name>>Phone>>Address:
            cout<<RollNo<<"/"<<Name<<"/"<<Phone<<"/"<<Address<<endl;
        }
        f.close();

    }
};

int main()
{
    FileHandling f;
    int choice;
    while (True)
    {
        cout<<"1. Add Data"<<endl;
        cout<<"2. Remove Data"<<endl;
        cout<<"3. Display Data"<<endl;
        cout<<"4. Exit"<<endl;
        cout<<"Enter your choice:";
        cin>>choice;
        
        if(choice==1)
        {
            f.adddata();
        }
        else if(choice==2)
        {
            f.RemoveData();
        }
        else if(choice==3)
        {
            f.DisplayData();
        }
        else if(choice==4)
        {
            break;
        }
        else
        {
            cout<<"Invalid choice, please try again."<<endl;
        }
    
}