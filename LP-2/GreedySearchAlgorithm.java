import java.util.*;

public class GreedySearchAlgorithm
{
    public int minKey(int key[], boolean mstSet[], int V)
    {
        int min = Integer.MAX_VALUE;
        int minIndex = -1;

        for(int i = 0; i < V; i++)
        {
            if(mstSet[i] == false && key[i] < min)
            {
                min = key[i];
                minIndex = i;
            }
        }
        return minIndex;
    }
    public void primMST(int graph[][], int V)
    {
        int parent[] = new int[V];
        int key[] = new int[V];
        boolean mstSet[] = new boolean[V];

        Arrays.fill(key, Integer.MAX_VALUE);

        key[0] = 0;
        parent[0] = -1;

        for(int count = 0; count < V - 1; count++)
        {
            int u = minKey(key, mstSet, V);
            mstSet[u] = true;

            for(int v = 0; v < V; v++)
            {
                if(graph[u][v] != 0 && mstSet[v] == false && graph[u][v] < key[v])
                {
                    parent[v] = u;
                    key[v] = graph[u][v];
                }
            }
        }

        System.out.println("Edge \t Weight");
        for(int i = 1; i < V; i++)
        {
            System.out.println(parent[i] + " - " + i + "\t " + graph[i][parent[i]]);
        }
    }

    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of vertices: ");
        int Vert = sc.nextInt();

        int graph[][] = new int[Vert][Vert];

        System.out.println("Enter adjacency matrix:");
        for(int i = 0; i < Vert; i++)
        {
            for(int j = 0; j < Vert; j++)
            {
                graph[i][j] = sc.nextInt();
            }
        }

        GreedySearchAlgorithm GSA = new GreedySearchAlgorithm();
        GSA.primMST(graph, Vert);

        sc.close();
    }
}