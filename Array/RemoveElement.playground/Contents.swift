/*
 🧹 Problem: Remove Element 

 Given an array nums and a value val,
 remove all instances of val in-place and return the new length.
*/

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var k = 0  // Pointer for new array position

        for i in 0..<nums.count {
            if nums[i] != val {
                nums[k] = nums[i]
                k += 1
            }
        }

        return k
    }
}

// MARK: - Test Cases

var nums1 = [3,2,2,3]
let solution = Solution()
let newLength1 = solution.removeElement(&nums1, 3)
print("New length: \(newLength1), Array: \(Array(nums1.prefix(newLength1)))")  // [2,2]

var nums2 = [0,1,2,2,3,0,4,2]
let newLength2 = solution.removeElement(&nums2, 2)
print("New length: \(newLength2), Array: \(Array(nums2.prefix(newLength2)))")  // [0,1,3,0,4]

