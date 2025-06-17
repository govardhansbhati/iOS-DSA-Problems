//: ## 🔍 Search Insert Position (LeetCode #35)
//:
//: ### 💡 Binary Search

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
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
    
    return left
}

//: ✅ Test Cases
print(searchInsert([1,3,5,6], 5))  // 2
print(searchInsert([1,3,5,6], 2))  // 1
print(searchInsert([1,3,5,6], 7))  // 4

