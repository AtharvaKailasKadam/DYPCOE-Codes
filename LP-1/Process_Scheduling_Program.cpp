#include<iostream>
using namespace std;

int main()
{
    int n;
    cout << "Enter the Number of Values you want to Pass:";
    cin >> n;

    int ArrivalTime[n];
    int BurstTime[n];
    int CompletionTime[n];
    int TurnAroundTime[n];
    int WaitingTime[n];

    cout << "Enter Arrival Time and the Burst Time:\n";

    for(int i = 0; i < n; i++)
    {
        cout << "Enter Arrival Time:";
        cin >> ArrivalTime[i];
        cout << "Enter the Burst Time:";
        cin >> BurstTime[i];
    }

    cout << "Arrival Time|Burst Time\n";

    for(int i = 0; i < n; i++)
    {
        cout << ArrivalTime[i] << "|" << BurstTime[i] << endl;
    }

    int CurrentTime = 0;

    for(int i = 0; i < n; i++)
    {
        if(CurrentTime < ArrivalTime[i])
        {
            CurrentTime = ArrivalTime[i];
        }
        CurrentTime = CurrentTime + BurstTime[i];
        CompletionTime[i] = CurrentTime;
    }

    for(int i = 0; i < n; i++)
    {
    TurnAroundTime[i] = CompletionTime[i] - ArrivalTime[i];
    WaitingTime[i] = TurnAroundTime[i] - BurstTime[i];
    }

    cout << "Arrival Time|Burst Time|Completion Time|Turnaround Time|Waiting Time\n";

    for(int i = 0; i < n; i++)
    {
    cout << ArrivalTime[i] << "|"
        << BurstTime[i] << "|"
        << CompletionTime[i] << "|"
        << TurnAroundTime[i] << "|"
        << WaitingTime[i] << endl;
    }

    return 0;
}
