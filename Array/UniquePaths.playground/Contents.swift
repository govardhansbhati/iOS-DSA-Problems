//: ## 🎯 Unique Paths (LeetCode #62)
//: Problem Statement:

/* A robot is located at the top-left corner of an m x n grid.
The robot can only move either down or right at any point.
How many unique paths are there to reach the bottom-right corner? */
//: ### 💡 2D Dynamic Programming

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var dp = Array(repeating: Array(repeating: 1, count: n), count: m)

    for i in 1..<m {
        for j in 1..<n {
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
        }
    }
    return dp[m-1][n-1]
}

//: ✅ Test Cases
print(uniquePaths(3, 7))  // Output: 28
print(uniquePaths(3, 2))  // Output: 3

