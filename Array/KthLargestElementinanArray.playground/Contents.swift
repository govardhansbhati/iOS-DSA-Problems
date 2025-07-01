//: ## 🔢 Kth Largest Element in an Array (LeetCode #215)
//:Given an integer array nums and an integer k, return the kth largest element in the array.
//: ### 💡 Min-Heap logic with sorted array

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var heap = [Int]()
    
    for num in nums {
        heap.append(num)
        heap.sort()  // Simulate min-heap
        if heap.count > k {
            heap.removeFirst() // Remove smallest
        }
    }
    
    return heap.first!  // kth largest
}

//: ✅ Test Case
let nums = [3,2,1,5,6,4]
let k = 2
print(findKthLargest(nums, k))  // Output: 5

