#include <iostream>
#include <algorithm>
#include <iomanip>

using namespace std;

int main()
{
    int n;
    cout << "Enter the number of processes: ";
    cin >> n;

    int pid[n];
    int at[n];
    int bt[n];
    int ct[n];
    int tat[n];
    int wt[n];
    bool completed[n];

    cout << "Enter Arrival Time and Burst Time for each process:\n";
    for (int i = 0; i < n; ++i)
    {
        pid[i] = i + 1;
        cout << "Process " << i + 1 << " Arrival Time: ";
        cin >> at[i];
        cout << "Process " << i + 1 << " Burst Time: ";
        cin >> bt[i];
        completed[i] = false;
    }

    for (int i = 0; i < n - 1; ++i)
    {
        for (int j = 0; j < n - i - 1; ++j)
        {
            if (at[j] > at[j + 1]) {
                swap(at[j], at[j + 1]);
                swap(bt[j], bt[j + 1]);
                swap(pid[j], pid[j + 1]);
            }
        }
    }

    int currentTime = 0;
    int completedCount = 0;

    while (completedCount < n)
    {
        int shortestJobIndex = -1;
        int shortestBurst = -1;

        for (int i = 0; i < n; ++i)
        {
            if (!completed[i] && at[i] <= currentTime)
            {
                if (shortestJobIndex == -1 || bt[i] < shortestBurst)
                {
                    shortestBurst = bt[i];
                    shortestJobIndex = i;
                }
            }
        }

        if (shortestJobIndex == -1)
        {
            int nextArrivalTime = -1;
            for(int i=0; i<n; ++i)
            {
                if(!completed[i])
                {
                    if(nextArrivalTime == -1 || at[i] < nextArrivalTime)
                    {
                        nextArrivalTime = at[i];
                    }
                }
            }
            currentTime = nextArrivalTime;
        } else
        {
            currentTime += bt[shortestJobIndex];
            ct[shortestJobIndex] = currentTime;
            tat[shortestJobIndex] = ct[shortestJobIndex] - at[shortestJobIndex];
            wt[shortestJobIndex] = tat[shortestJobIndex] - bt[shortestJobIndex];
            completed[shortestJobIndex] = true;
            completedCount++;
        }
    }

    double total_wt = 0;
    double total_tat = 0;

    cout << "\nPID\tAT\tBT\tCT\tTAT\tWT\n";
    cout << setfill('-') << setw(45) << "" << setfill(' ') << endl;

    for (int i = 0; i < n; ++i)
    {
        cout << pid[i] << "\t" << at[i] << "\t" << bt[i] << "\t" << ct[i] << "\t" << tat[i] << "\t" << wt[i] << endl;
        total_wt += wt[i];
        total_tat += tat[i];
    }

    cout << "\nAverage Waiting Time: " << total_wt / n << endl;
    cout << "Average Turnaround Time: " << total_tat / n << endl;

    return 0;
}