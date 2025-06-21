//: ## 🔁 Permutations (LeetCode #46)
//:
//: ### 💡 Backtracking
///Problem Statement:

///Given an array nums of distinct integers, return all possible permutations.

func permute(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var path = [Int]()
    var used = Array(repeating: false, count: nums.count)
    
    func backtrack() {
        if path.count == nums.count {
            result.append(path)
            return
        }
        
        for i in 0..<nums.count {
            if used[i] { continue }
            path.append(nums[i])
            used[i] = true
            backtrack()
            path.removeLast()
            used[i] = false
        }
    }
    
    backtrack()
    return result
}

//: ✅ Test Case
let nums = [1, 2, 3]
print(permute(nums))

