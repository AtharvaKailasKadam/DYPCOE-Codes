def solve_n_queens_backtracking(n):
    board = [-1] * n
    solutions = []

    def is_safe(row, col):
        for i in range(row):
            if board[i] == col or abs(board[i] - col) == abs(i - row):
                return False
        return True

    def backtrack(row):
        if row == n:
            solutions.append(board[:])
            return

        for col in range(n):
            if is_safe(row, col):
                board[row] = col
                backtrack(row + 1)
                board[row] = -1

    backtrack(0)
    return solutions


def solve_n_queens_branch_bound(n):
    board = [-1] * n
    solutions = []

    cols = [False] * n
    diag1 = [False] * (2 * n - 1)
    diag2 = [False] * (2 * n - 1)

    def backtrack(row):
        if row == n:
            solutions.append(board[:])
            return

        for col in range(n):
            d1 = row - col + (n - 1)
            d2 = row + col

            if not cols[col] and not diag1[d1] and not diag2[d2]:
                board[row] = col
                cols[col] = diag1[d1] = diag2[d2] = True

                backtrack(row + 1)

                board[row] = -1
                cols[col] = diag1[d1] = diag2[d2] = False

    backtrack(0)
    return solutions


n = 4

print("Backtracking Solutions:")
solutions1 = solve_n_queens_backtracking(n)
print(f"Total solutions: {len(solutions1)}")
for sol in solutions1:
    print(sol)

print("\nBranch and Bound Solutions:")
solutions2 = solve_n_queens_branch_bound(n)
print(f"Total solutions: {len(solutions2)}")
for sol in solutions2:
    print(sol)

print("\n")