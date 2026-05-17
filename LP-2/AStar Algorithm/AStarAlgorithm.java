import java.util.Scanner;

public class AStarAlgorithm
{
    int n;
    int[][] graph;
    int[] heuristic;
    boolean[] visited;

    // Function to find node with minimum f(n)
    public int getMinNode(int[] f)
    {
        int min = Integer.MAX_VALUE;
        int index = -1;

        for(int i = 0; i < n; i++)
        {
            if(!visited[i] && f[i] < min)
            {
                min = f[i];
                index = i;
            }
        }
        return index;
    }

    public void AStar(int start, int goal)
    {
        int[] g = new int[n]; // cost from start
        int[] f = new int[n]; // total cost

        for(int i = 0; i < n; i++)
        {
            g[i] = Integer.MAX_VALUE;
            f[i] = Integer.MAX_VALUE;
        }

        g[start] = 0;
        f[start] = heuristic[start];

        System.out.print("\nPath: ");

        while(true)
        {
            int current = getMinNode(f);

            if(current == -1)
                break;

            System.out.print(current + " ");
            visited[current] = true;

            if(current == goal)
                break;

            for(int i = 0; i < n; i++)
            {
                if(graph[current][i] > 0 && !visited[i])
                {
                    int newCost = g[current] + graph[current][i];

                    if(newCost < g[i])
                    {
                        g[i] = newCost;
                        f[i] = g[i] + heuristic[i];
                    }
                }
            }
        }

        System.out.println("\nGoal Reached!");
    }

    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);

        System.out.println("A* Algorithm Implementation");

        System.out.print("Enter number of nodes: ");
        int n = scanner.nextInt();

        AStarAlgorithm obj = new AStarAlgorithm();
        obj.n = n;
        obj.graph = new int[n][n];
        obj.heuristic = new int[n];
        obj.visited = new boolean[n];

        System.out.println("Enter adjacency matrix (cost, 0 if no edge):");
        for(int i = 0; i < n; i++)
        {
            for(int j = 0; j < n; j++)
            {
                obj.graph[i][j] = scanner.nextInt();
            }
        }

        System.out.println("Enter heuristic values:");
        for(int i = 0; i < n; i++)
        {
            obj.heuristic[i] = scanner.nextInt();
        }

        System.out.print("Enter start node: ");
        int start = scanner.nextInt();

        System.out.print("Enter goal node: ");
        int goal = scanner.nextInt();

        scanner.close();

        obj.AStar(start, goal);
    }
}


/*
================ SAMPLE INPUT =================
Enter number of nodes: 4

Adjacency Matrix:
0 1 4 0
1 0 2 5
4 2 0 1
0 5 1 0

Heuristic Values:
7 6 2 0

Start Node: 0
Goal Node: 3

================ OUTPUT =================
Path: 0 1 2 3
Goal Reached!

=============================================
*/