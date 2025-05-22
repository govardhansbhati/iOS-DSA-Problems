//: ## 2️⃣2️⃣ Product of Array Except Self
//: - LeetCode #238
//: - Given an integer array `nums`, return an array `output` such that `output[i]` is equal to the product of all the elements of `nums` except `nums[i]`.
//: - Solve it without using division and in O(n) time.

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var output = Array(repeating: 1, count: nums.count)

    var leftProduct = 1
    for i in 0..<nums.count {
        output[i] *= leftProduct
        leftProduct *= nums[i]
    }

    var rightProduct = 1
    for i in stride(from: nums.count - 1, to: -1, by: -1) {
        output[i] *= rightProduct
        rightProduct *= nums[i]
    }

    return output
}

//: ✅ Test
print("Product Except Self:", productExceptSelf([1,2,3,4])) // Output: [24,12,8,6]
print("Product Except Self:", productExceptSelf([-1,1,0,-3,3])) // Output: [0,0,9,0,0]

