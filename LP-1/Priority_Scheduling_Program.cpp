#include <iostream>
#include <iomanip>
#include <climits>

using namespace std;

int main()
{
    int n;
    cout << "Enter the number of processes: ";
    cin >> n;

    int pid[n];
    int at[n];
    int bt[n];
    int pri[n];
    int ct[n];
    int tat[n];
    int wt[n];
    bool completed[n];

    cout << "Enter Arrival Time, Burst Time, and Priority for each process:\n";
    for (int i = 0; i < n; ++i)
    {
        pid[i] = i + 1;
        cout << "Process " << i + 1 << " Arrival Time: ";
        cin >> at[i];
        cout << "Process " << i + 1 << " Burst Time: ";
        cin >> bt[i];
        cout << "Process " << i + 1 << " Priority: ";
        cin >> pri[i];
        completed[i] = false;
    }

    int currentTime = 0;
    int completedCount = 0;

    while (completedCount < n)
    {
        int highestPriorityIndex = -1;
        int highestPriority = INT_MAX;
        for (int i = 0; i < n; ++i)
        {
            if (!completed[i] && at[i] <= currentTime)
            {
                if (pri[i] < highestPriority)
                {
                    highestPriority = pri[i];
                    highestPriorityIndex = i;
                }

                else if (pri[i] == highestPriority)
                {
                    if (at[i] < at[highestPriorityIndex])
                    {
                        highestPriorityIndex = i;
                    }
                }
            }
        }

        if (highestPriorityIndex == -1)
        {
            int nextArrivalTime = INT_MAX;
            for(int i = 0; i < n; ++i)
            {
                if(!completed[i] && at[i] < nextArrivalTime)
                {
                    nextArrivalTime = at[i];
                }
            }
            currentTime = nextArrivalTime;
        }
        else
        {
            int i = highestPriorityIndex;
            currentTime += bt[i];
            ct[i] = currentTime;
            tat[i] = ct[i] - at[i];
            wt[i] = tat[i] - bt[i];
            completed[i] = true;
            completedCount++;
        }
    }

    double total_wt = 0;
    double total_tat = 0;

    for (int i = 0; i < n - 1; ++i) {
        for (int j = 0; j < n - i - 1; ++j) {
            if (pid[j] > pid[j + 1]) {
                swap(pid[j], pid[j+1]);
                swap(at[j], at[j+1]);
                swap(bt[j], bt[j+1]);
                swap(pri[j], pri[j+1]);
                swap(ct[j], ct[j+1]);
                swap(tat[j], tat[j+1]);
                swap(wt[j], wt[j+1]);
            }
        }
    }


    cout << "\nPID\tAT\tBT\tPRI\tCT\tTAT\tWT\n";
    cout << setfill('-') << setw(50) << "" << setfill(' ') << endl;

    for (int i = 0; i < n; ++i)
    {
        cout << pid[i] << "\t" << at[i] << "\t" << bt[i] << "\t" << pri[i] << "\t" << ct[i] << "\t" << tat[i] << "\t" << wt[i] << endl;
        total_wt += wt[i];
        total_tat += tat[i];
    }

    cout << "\nAverage Waiting Time: " << total_wt / n << endl;
    cout << "Average Turnaround Time: " << total_tat / n << endl;

    return 0;
}