//: ## 🧹 LeetCode #27: Remove Element
//:
//: ### 🧩 Problem
//: Remove all instances of a given value in-place from an array.
//: Return the new length of the array after removal.
//:
//: ### 💡 Approach
//: - Use two pointers.
//: - Move valid (non-val) items to the front of the array.
//: - Return the index of the last valid element + 1.

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var index = 0

    for num in nums {
        if num != val {
            nums[index] = num
            index += 1
        }
    }

    return index
}

//: ✅ Test Cases
var nums1 = [3, 2, 2, 3]
let length1 = removeElement(&nums1, 3)
print("New length: \(length1), Modified array: \(Array(nums1.prefix(length1)))")

var nums2 = [0,1,2,2,3,0,4,2]
let length2 = removeElement(&nums2, 2)
print("New length: \(length2), Modified array: \(Array(nums2.prefix(length2)))")

