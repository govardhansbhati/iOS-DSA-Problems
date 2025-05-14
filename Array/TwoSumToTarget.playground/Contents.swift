//: ## 1️⃣3️⃣ Two Sum
//: - LeetCode #1
//: - Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.
//: - Assume that each input would have exactly one solution, and you may not use the same element twice.

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var numToIndex = [Int: Int]()

    for (index, num) in nums.enumerated() {
        let complement = target - num
        if let foundIndex = numToIndex[complement] {
            return [foundIndex, index]
        }
        numToIndex[num] = index
    }

    return [] // No solution found, though the problem guarantees one.
}

//: ✅ Test
print("Two Sum indices:", twoSum([2, 7, 11, 15], 9)) // Output: [0, 1]
print("Two Sum indices:", twoSum([3, 2, 4], 6))      // Output: [1, 2]

