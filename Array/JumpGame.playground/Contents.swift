//: ## 🦘 LeetCode #55: Jump Game
//:
//: ### 💡 Approach
//: - Track the farthest index you can reach from each position
//: - If at any point your max reach is less than the current index, return false

func canJump(_ nums: [Int]) -> Bool {
    var maxReach = 0
    for i in 0..<nums.count {
        if i > maxReach { return false }
        maxReach = max(maxReach, i + nums[i])
    }
    return true
}

//: ✅ Test Cases
print(canJump([2,3,1,1,4]))   // true
print(canJump([3,2,1,0,4]))   // false
print(canJump([0]))           // true (already at the last index)
print(canJump([1, 0, 1, 0]))  // false

