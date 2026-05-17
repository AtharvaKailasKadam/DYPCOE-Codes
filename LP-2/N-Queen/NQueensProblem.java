import java.util.Scanner;

public class NQueensProblem
{
    int[] board;

    public boolean isSafe(int row, int col)
    {
        for(int i = 0; i < row; i++)
        {
            if(board[i] == col)
                return false;

            if(Math.abs(board[i] - col) == Math.abs(i - row))
                return false;
        }
        return true;
    }

    public boolean solveNQueens(int row, int n)
    {
        if(row == n)
            return true;

        for(int col = 0; col < n; col++)
        {
            if(isSafe(row, col))
            {
                board[row] = col;

                if(solveNQueens(row + 1, n))
                    return true;

                board[row] = -1;
            }
        }
        return false;
    }

    public void printSolution(int n)
    {
        System.out.println("\n--- Solution ---");
        for(int i = 0; i < n; i++)
        {
            for(int j = 0; j < n; j++)
            {
                if(board[i] == j)
                    System.out.print(" Q ");
                else
                    System.out.print(" . ");
            }
            System.out.println();
        }
    }

    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);

        System.out.println("N-Queens Problem using Backtracking & Branch and Bound");

        System.out.print("Enter value of N: ");
        int n = scanner.nextInt();

        scanner.close();

        NQueensProblem obj = new NQueensProblem();
        obj.board = new int[n];

        for(int i = 0; i < n; i++)
            obj.board[i] = -1;

        if(obj.solveNQueens(0, n))
        {
            obj.printSolution(n);
        }
        else
        {
            System.out.println("No Solution Exists");
        }
    }
}