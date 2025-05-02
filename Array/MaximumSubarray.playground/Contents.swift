//: ## 4️⃣ Maximum Subarray (Kadane’s Algorithm)
//: - LeetCode #53
//: - Given an integer array `nums`, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
import Foundation
func maxSubArray(_ nums: [Int]) -> Int {
    var currentSum = nums[0]
    var maxSum = nums[0]

    for i in 1..<nums.count {
        currentSum = max(nums[i], currentSum + nums[i])
        maxSum = max(maxSum, currentSum)
    }

    return maxSum
}

//: ✅ Test
print("Maximum Subarray Sum:", maxSubArray([-2,1,-3,4,-1,2,1,-5,4])) // Output: 6
// Explanation: [4,-1,2,1] has the largest sum = 6

