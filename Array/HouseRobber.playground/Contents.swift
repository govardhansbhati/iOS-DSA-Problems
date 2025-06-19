
//: ## 🎯 House Robber (LeetCode #198)
//:
//: ### 💡 Dynamic Programming (Bottom-up)

/*
 Problem Statement:

 You are a professional robber planning to rob houses along a street.
 Each house has a certain amount of money stashed, but adjacent houses have security systems connected — you cannot rob two adjacent houses.

 Given an integer array nums representing the amount of money at each house, return the maximum amount of money you can rob without alerting the police.
 */


func rob(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return nums.first ?? 0 }
    
    var prev1 = 0
    var prev2 = 0
    
    for num in nums {
        let temp = max(prev1, prev2 + num)
        prev2 = prev1
        prev1 = temp
    }
    
    return prev1
}

//: ✅ Test Cases
print(rob([2, 7, 9, 3, 1]))  // Output: 12
print(rob([1, 2, 3, 1]))     // Output: 4
