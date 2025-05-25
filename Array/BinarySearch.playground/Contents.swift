//: ## 2️⃣5️⃣ Binary Search
//: - LeetCode #704
//: - Given an array of integers `nums` which is sorted in ascending order, and an integer `target`,
//:   return the index of the target if it is in the array. If not, return -1.
//: - Must use binary search (O(log n)).

func binarySearch(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1

    while left <= right {
        let mid = left + (right - left) / 2
        if nums[mid] == target {
            return mid
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return -1
}

//: ✅ Test
print("Binary Search Result:", binarySearch([-1,0,3,5,9,12], 9))  // Output: 4
print("Binary Search Result:", binarySearch([-1,0,3,5,9,12], 2))  // Output: -1

