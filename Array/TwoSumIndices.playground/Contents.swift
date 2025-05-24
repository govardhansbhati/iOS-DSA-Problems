//: ## 2️⃣4️⃣ Two Sum II - Input Array Is Sorted
//: - LeetCode #167
//: - Given a 1-indexed array of integers `numbers` that is already sorted in non-decreasing order,
//:   find two numbers such that they add up to a specific target number.
//: - Return the indices of the two numbers (1-indexed) as an array of length 2.
//: - Use the two-pointer technique for O(n) time complexity.

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = numbers.count - 1

    while left < right {
        let sum = numbers[left] + numbers[right]
        if sum == target {
            return [left + 1, right + 1]
        } else if sum < target {
            left += 1
        } else {
            right -= 1
        }
    }

    return []
}

//: ✅ Test
print("Two Sum II Result:", twoSum([2,7,11,15], 9))      // Output: [1,2]
print("Two Sum II Result:", twoSum([1,2,3,4,4,9,56,90], 8)) // Output: [4,5]

