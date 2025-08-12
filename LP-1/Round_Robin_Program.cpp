#include<iostream>
#include<iomanip>

using namespace std;

int main()
{
    int n, time_quantum;
    cout << "Enter the Number of Processes you want to Pass: ";
    cin >> n;

    int pid[n];
    int arrivalTime[n];
    int burstTime[n];
    int remainingBurstTime[n];
    int completionTime[n];
    int turnAroundTime[n];
    int waitingTime[n];

    cout << "Enter Arrival Time and Burst Time for each process:\n";
    for(int i = 0; i < n; i++)
    {
        pid[i] = i + 1;
        cout << "Process " << pid[i] << " Arrival Time: ";
        cin >> arrivalTime[i];
        cout << "Process " << pid[i] << " Burst Time: ";
        cin >> burstTime[i];
        remainingBurstTime[i] = burstTime[i];
    }

    cout << "Enter the Time Quantum: ";
    cin >> time_quantum;

    int currentTime = 0;
    int completedCount = 0;
    cout << "\nProcessing...\n";
    while(completedCount < n)
    {
        bool process_executed = false;
        for(int i = 0; i < n; i++)
        {
            if(remainingBurstTime[i] > 0 && arrivalTime[i] <= currentTime)
            {
                process_executed = true;
                if(remainingBurstTime[i] > time_quantum)
                {
                    currentTime += time_quantum;
                    remainingBurstTime[i] -= time_quantum;
                }
                else
                {
                    currentTime += remainingBurstTime[i];
                    remainingBurstTime[i] = 0;
                    completionTime[i] = currentTime;
                    turnAroundTime[i] = completionTime[i] - arrivalTime[i];
                    waitingTime[i] = turnAroundTime[i] - burstTime[i];
                    completedCount++;
                }
            }
        }
        if(!process_executed)
        {
            currentTime++;
        }
    }

    cout << "\nPID\tAT\tBT\tCT\tTAT\tWT\n";
    cout << setfill('-') << setw(50) << "" << setfill(' ') << endl;

    double total_wt = 0;
    double total_tat = 0;

    for(int i = 0; i < n; i++)
    {
        cout << pid[i] << "\t"
            << arrivalTime[i] << "\t"
            << burstTime[i] << "\t"
            << completionTime[i] << "\t"
            << turnAroundTime[i] << "\t"
            << waitingTime[i] << endl;
        total_wt += waitingTime[i];
        total_tat += turnAroundTime[i];
    }

    cout << "\nAverage Waiting Time: " << total_wt / n << endl;
    cout << "Average Turnaround Time: " << total_tat / n << endl;

    return 0;
}