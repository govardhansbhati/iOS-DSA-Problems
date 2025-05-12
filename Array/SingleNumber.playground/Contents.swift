//: ## 1️⃣1️⃣ Single Number
//: - LeetCode #136
//: - Given a non-empty array of integers, every element appears twice except for one. Find that single one.
//: - You must implement a solution with a linear runtime and constant space.

func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    for num in nums {
        result ^= num // XOR cancels out duplicates
    }
    return result
}

//: ✅ Test
print("Single Number:", singleNumber([4,1,2,1,2])) // Output: 4
print("Single Number:", singleNumber([2,2,1]))     // Output: 1

