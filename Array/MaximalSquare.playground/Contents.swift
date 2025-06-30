//: ## 🔲 Maximal Square (LeetCode #221)
//: Given a 2D binary matrix filled with '0's and '1's, find the largest square containing only 1s and return its area.
//: ### 💡 Dynamic Programming

func maximalSquare(_ matrix: [[Character]]) -> Int {
    guard !matrix.isEmpty else { return 0 }

    let rows = matrix.count
    let cols = matrix[0].count
    var dp = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows + 1)
    var maxLen = 0

    for i in 1...rows {
        for j in 1...cols {
            if matrix[i-1][j-1] == "1" {
                dp[i][j] = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])
                maxLen = max(maxLen, dp[i][j])
            }
        }
    }

    return maxLen * maxLen  // Area = side^2
}

//: ✅ Test Case
let matrix: [[Character]] = [
    ["1","0","1","0","0"],
    ["1","0","1","1","1"],
    ["1","1","1","1","1"],
    ["1","0","0","1","0"]
]
print(maximalSquare(matrix))  // Output: 4

