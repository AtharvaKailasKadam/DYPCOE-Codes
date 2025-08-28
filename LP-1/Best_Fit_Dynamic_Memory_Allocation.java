public class Best_Fit_Dynamic_Memory_Allocation
{
    public void BestFit(int[] MemoryBlockSize, int[] ProcessSize)
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
            int bestIdx = -1;
            for(int k = 0; k < n; k++)
            {
                if (MemoryBlockSize[k] >= ProcessSize[i])
                {
                    if (bestIdx == -1 || MemoryBlockSize[k] < MemoryBlockSize[bestIdx])
                    {
                        bestIdx = k;
                    }
                }
            }

            if (bestIdx != -1)
            {
                allocation[i] = bestIdx;
                MemoryBlockSize[bestIdx] = -1;
            }
        }

        System.out.println("Process No.\tProcess Size\tBlock No.");
        for(int i = 0; i < m; i++)
        {
            System.out.print(" " + (i+1) + "\t\t" + ProcessSize[i] + "\t\t");
            if(allocation[i] != -1)
            {
                System.out.println(allocation[i]+1);
            }
            else
            {
                System.out.println("Not Allocated");
            }
        }
    }
    public static void main(String[] args)
    {
        int[] MemoryBlockSize = {100, 500, 200, 300, 600};
        int[] ProcessSize = {212, 417, 112, 426};

        Best_Fit_Dynamic_Memory_Allocation BF = new Best_Fit_Dynamic_Memory_Allocation();
        BF.BestFit(MemoryBlockSize, ProcessSize);
    }
}
