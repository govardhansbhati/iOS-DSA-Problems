//: ## 1️⃣2️⃣ Move Zeroes
//: - LeetCode #283
//: - Given an integer array `nums`, move all `0`'s to the end while maintaining the relative order of the non-zero elements.
//: - Do this in-place without making a copy of the array.

func moveZeroes(_ nums: inout [Int]) {
    var lastNonZeroIndex = 0

    for current in 0..<nums.count {
        if nums[current] != 0 {
            nums.swapAt(lastNonZeroIndex, current)
            lastNonZeroIndex += 1
        }
    }
}

//: ✅ Test
var nums1 = [0,1,0,3,12]
moveZeroes(&nums1)
print("After moving zeroes:", nums1) // Output: [1, 3, 12, 0, 0]

var nums2 = [0, 0, 1]
moveZeroes(&nums2)
print("After moving zeroes:", nums2) // Output: [1, 0, 0]

