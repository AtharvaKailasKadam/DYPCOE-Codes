package DFSnBFS;

import java.util.Scanner;
import java.util.LinkedList;
import java.util.Queue;

public class GraphTraversal
{
    int[][] graph;
    boolean[] visited;

    // Recursive DFS
    public void DFS(int node, int n)
    {
        System.out.print(node + " ");
        visited[node] = true;

        for(int i = 0; i < n; i++)
        {
            if(graph[node][i] == 1 && !visited[i])
            {
                DFS(i, n);
            }
        }
    }

    // BFS using Queue
    public void BFS(int start, int n)
    {
        Queue<Integer> queue = new LinkedList<>();
        boolean[] visitedBFS = new boolean[n];

        queue.add(start);
        visitedBFS[start] = true;

        while(!queue.isEmpty())
        {
            int node = queue.poll();
            System.out.print(node + " ");

            for(int i = 0; i < n; i++)
            {
                if(graph[node][i] == 1 && !visitedBFS[i])
                {
                    queue.add(i);
                    visitedBFS[i] = true;
                }
            }
        }
    }

    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Menu Driven Graph Traversal (DFS & BFS)");

        System.out.print("Enter number of vertices: ");
        int n = scanner.nextInt();

        GraphTraversal obj = new GraphTraversal();
        obj.graph = new int[n][n];

        System.out.println("Enter adjacency matrix (0 or 1):");
        for(int i = 0; i < n; i++)
        {
            for(int j = 0; j < n; j++)
            {
                obj.graph[i][j] = scanner.nextInt();
            }
        }

        int choice;
        do
        {
            System.out.println("\n--- MENU ---");
            System.out.println("1. DFS Traversal");
            System.out.println("2. BFS Traversal");
            System.out.println("3. Exit");
            System.out.print("Enter your choice: ");
            choice = scanner.nextInt();

            switch(choice)
            {
                case 1:
                    obj.visited = new boolean[n];
                    System.out.print("Enter starting vertex: ");
                    int startDFS = scanner.nextInt();
                    System.out.print("DFS Traversal: ");
                    obj.DFS(startDFS, n);
                    System.out.println();
                    break;

                case 2:
                    System.out.print("Enter starting vertex: ");
                    int startBFS = scanner.nextInt();
                    System.out.print("BFS Traversal: ");
                    obj.BFS(startBFS, n);
                    System.out.println();
                    break;

                case 3:
                    System.out.println("Exiting...");
                    break;

                default:
                    System.out.println("Invalid Choice!");
            }

        } while(choice != 3);

        scanner.close();
    }
}