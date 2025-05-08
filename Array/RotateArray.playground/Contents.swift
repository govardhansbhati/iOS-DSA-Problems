//: 🔟 Rotate Array
//: - LeetCode #189
//: - Given an array, rotate the array to the right by `k` steps, where `k` is non-negative.
//: - Do this in-place with O(1) extra space if possible.

func rotate(_ nums: inout [Int], _ k: Int) {
    let k = k % nums.count
    nums.reverse()
    reverse(&nums, 0, k - 1)
    reverse(&nums, k, nums.count - 1)
}

func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
    var start = start, end = end
    while start < end {
        nums.swapAt(start, end)
        start += 1
        end -= 1
    }
}

//: ✅ Test
var nums = [1,2,3,4,5,6,7]
rotate(&nums, 3)
print("Rotated Array:", nums) // Output: [5,6,7,1,2,3,4]

