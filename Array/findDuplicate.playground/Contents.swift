//: ## 2️⃣0️⃣ Find All Duplicates in an Array
//: - LeetCode #442
//: - Given an integer array `nums` of length `n` where all the integers of `nums` are in the range [1, n]
//:   and each integer appears once or twice, return all the elements that appear twice.
//: - Try to solve it in O(n) time and use no extra space (ignore the output list).

func findDuplicates(_ nums: [Int]) -> [Int] {
    var result = [Int]()
    var nums = nums // to make it mutable if the original is let

    for i in 0..<nums.count {
        let index = abs(nums[i]) - 1
        if nums[index] < 0 {
            result.append(abs(nums[i]))
        } else {
            nums[index] = -nums[index]
        }
    }

    return result
}

//: ✅ Test
print("Duplicates:", findDuplicates([4,3,2,7,8,2,3,1])) // Output: [2,3]
print("Duplicates:", findDuplicates([1,1,2]))           // Output: [1]

