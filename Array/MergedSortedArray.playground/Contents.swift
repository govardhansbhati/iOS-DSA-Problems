//: ## 1️⃣4️⃣ Merge Sorted Array
//: - LeetCode #88
//: - You are given two integer arrays `nums1` and `nums2`, sorted in non-decreasing order,
//:   and two integers `m` and `n`, representing the number of elements in `nums1` and `nums2` respectively.
//: - Merge `nums2` into `nums1` as one sorted array.
//: - Note: `nums1` has a length of `m + n`, with the last `n` elements set to 0 (empty space for `nums2`).

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = m - 1
    var j = n - 1
    var k = m + n - 1

    while j >= 0 {
        if i >= 0 && nums1[i] > nums2[j] {
            nums1[k] = nums1[i]
            i -= 1
        } else {
            nums1[k] = nums2[j]
            j -= 1
        }
        k -= 1
    }
}

//: ✅ Test
var nums1 = [1,2,3,0,0,0]
let nums2 = [2,5,6]
merge(&nums1, 3, nums2, 3)
print("Merged Array:", nums1) // Output: [1,2,2,3,5,6]

