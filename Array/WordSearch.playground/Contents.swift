//: ## 🔤 Word Search in 2D Grid (LeetCode #79)
//:
//: ### 💡 DFS with Backtracking

func exist(_ board: [[Character]], _ word: String) -> Bool {
    var board = board
    let rows = board.count
    let cols = board[0].count
    let wordChars = Array(word)

    func dfs(_ i: Int, _ j: Int, _ index: Int) -> Bool {
        if index == wordChars.count { return true }
        if i < 0 || i >= rows || j < 0 || j >= cols || board[i][j] != wordChars[index] {
            return false
        }

        let temp = board[i][j]
        board[i][j] = "#"

        let found = dfs(i+1, j, index+1) ||
                    dfs(i-1, j, index+1) ||
                    dfs(i, j+1, index+1) ||
                    dfs(i, j-1, index+1)

        board[i][j] = temp
        return found
    }

    for i in 0..<rows {
        for j in 0..<cols {
            if dfs(i, j, 0) {
                return true
            }
        }
    }

    return false
}

//: ✅ Test Case
let board: [[Character]] = [["A","B","C","E"],
                            ["S","F","C","S"],
                            ["A","D","E","E"]]

print(exist(board, "ABCCED"))  // Output: true
print(exist(board, "SEE"))     // Output: true
print(exist(board, "ABCB"))    // Output: false

