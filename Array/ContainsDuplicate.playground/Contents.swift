//: ## 7️⃣ Contains Duplicate
//: - LeetCode #217
//: - Given an integer array `nums`, return `true` if any value appears at least twice in the array, and `false` if every element is distinct.

func containsDuplicate(_ nums: [Int]) -> Bool {
    var seen = Set<Int>()
    for num in nums {
        if seen.contains(num) {
            return true
        }
        seen.insert(num)
    }
    return false
}

//: ✅ Test
print("Contains Duplicate:", containsDuplicate([1, 2, 3, 1])) // Output: true
print("Contains Duplicate:", containsDuplicate([1, 2, 3, 4])) // Output: false

