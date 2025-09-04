public class Worst_Fit_Dynamic_Memory_Allocation
{
    public void WorstFit(int[] MemoryBlockSize, int[] ProcessSize)
    {
        int n = MemoryBlockSize.length;
        int m = ProcessSize.length;

        int[] allocation = new int[m];
        for(int i = 0; i < m; i++)
        {
            allocation[i] = -1;
        }

        for(int i = 0; i < m; i++)
        {
            int worstIdx = -1;

            for(int k = 0; k < n; k++)
            {
                if (MemoryBlockSize[k] >= ProcessSize[i])
                {
                    if (worstIdx == -1 || MemoryBlockSize[k] > MemoryBlockSize[worstIdx])
                    {
                        worstIdx = k;
                    }
                }
            }

            if (worstIdx != -1)
            {
                allocation[i] = worstIdx;
                MemoryBlockSize[worstIdx] = -1;
            }
        }

        System.out.println("Process No.\tProcess Size\tBlock No.");
        for(int i = 0; i < m; i++)
        {
            System.out.print(" " + (i+1) + "\t\t" + ProcessSize[i] + "\t\t");
            if(allocation[i] != -1)
            {
                System.out.print(allocation[i] + 1);
            }
            else
            {
                System.out.print("Not Allocated");
            }
            System.out.println();
        }
    }
    public static void main(String[] args)
    {
        int[] MemoryBlockSize = {100, 500, 200, 300, 600};
        int[] ProcessSize = {212, 417, 112, 426};

        Worst_Fit_Dynamic_Memory_Allocation WF = new Worst_Fit_Dynamic_Memory_Allocation();
        WF.WorstFit(MemoryBlockSize, ProcessSize);
    }
}
// Done