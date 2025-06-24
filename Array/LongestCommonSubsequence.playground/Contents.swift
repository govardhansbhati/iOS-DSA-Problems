//: ## 🎯 Longest Common Subsequence (LeetCode #1143)
//:Problem Statement:

//Given two strings text1 and text2, return the length of their longest common subsequence (LCS).
//A subsequence is a sequence that appears in the same relative order but not necessarily contiguous.
//: ### 💡 2D Dynamic Programming

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    let m = text1.count
    let n = text2.count
    let s1 = Array(text1)
    let s2 = Array(text2)

    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
    
    for i in 1...m {
        for j in 1...n {
            if s1[i-1] == s2[j-1] {
                dp[i][j] = 1 + dp[i-1][j-1]
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            }
        }
    }
    
    return dp[m][n]
}

//: ✅ Test Case
let text1 = "abcde"
let text2 = "ace"
print(longestCommonSubsequence(text1, text2))  // Output: 3

