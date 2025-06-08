//: ## 🔄 LeetCode #88: Merge Sorted Array
//:
//: ### 🧩 Problem
//: Merge two sorted arrays into one sorted array in-place in nums1.
//:
//: ### 💡 Approach
//: - Start from the back to avoid overwriting nums1.
//: - Use three pointers: p1 (end of m), p2 (end of n), and p (end of nums1).

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var p1 = m - 1
    var p2 = n - 1
    var p = m + n - 1

    while p1 >= 0 && p2 >= 0 {
        if nums1[p1] > nums2[p2] {
            nums1[p] = nums1[p1]
            p1 -= 1
        } else {
            nums1[p] = nums2[p2]
            p2 -= 1
        }
        p -= 1
    }

    while p2 >= 0 {
        nums1[p] = nums2[p2]
        p2 -= 1
        p -= 1
    }
}

//: ✅ Test Case
var nums1 = [1,2,3,0,0,0]
let nums2 = [2,5,6]
merge(&nums1, 3, nums2, 3)
print(nums1)  // Output: [1,2,2,3,5,6]

