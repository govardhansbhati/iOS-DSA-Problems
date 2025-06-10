//: ## 🧩 LeetCode #37: Sudoku Solver (Backtracking)
//:
//: ### 💡 Approach
//: - Use recursion to try each number at each empty cell
//: - Use backtracking to undo a number if it leads to conflict

func solveSudoku(_ board: inout [[Character]]) {
    func isValid(_ row: Int, _ col: Int, _ char: Character) -> Bool {
        for i in 0..<9 {
            if board[row][i] == char { return false }
            if board[i][col] == char { return false }
            if board[3 * (row/3) + i/3][3 * (col/3) + i%3] == char { return false }
        }
        return true
    }

    func backtrack() -> Bool {
        for row in 0..<9 {
            for col in 0..<9 {
                if board[row][col] == "." {
                    for num in "123456789" {
                        if isValid(row, col, num) {
                            board[row][col] = num
                            if backtrack() {
                                return true
                            }
                            board[row][col] = "." // Backtrack
                        }
                    }
                    return false
                }
            }
        }
        return true
    }

    _ = backtrack()
}

//: ✅ Example Usage
var board: [[Character]] = [
    ["5","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]
]

solveSudoku(&board)
for row in board {
    print(row.map { String($0) }.joined(separator: " "))
}

