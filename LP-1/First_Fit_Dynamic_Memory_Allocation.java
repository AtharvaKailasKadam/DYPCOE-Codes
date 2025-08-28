public class First_Fit_Dynamic_Memory_Allocation
{
    public void FirstFit(int[] MemoryBlockSize, int[] ProcessSize)
    {
        int n = MemoryBlockSize.length;
        int m = ProcessSize.length;

        int[] allocation = new int[m];
        for (int i = 0; i < m; i++)
        {
            allocation[i] = -1;
        }

        for(int i = 0; i < m; i++)
        {
            for(int j = 0; j<n; j++)
            {
                if(MemoryBlockSize[j] >= ProcessSize[i])
                {
                    allocation[i] = j;
                    MemoryBlockSize[j] = -1;
                    break;
                }
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

        First_Fit_Dynamic_Memory_Allocation FF = new First_Fit_Dynamic_Memory_Allocation();
        FF.FirstFit(MemoryBlockSize, ProcessSize);

    }
}
