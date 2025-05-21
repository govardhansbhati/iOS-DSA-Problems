//: ## 2️⃣1️⃣ Majority Element
//: - LeetCode #169
//: - Given an array `nums` of size `n`, return the majority element.
//: - The majority element is the element that appears more than ⌊n / 2⌋ times.
//: - You may assume that the majority element always exists in the array.

func majorityElement(_ nums: [Int]) -> Int {
    var count = 0
    var candidate = nums[0]

    for num in nums {
        if count == 0 {
            candidate = num
        }
        count += (num == candidate) ? 1 : -1
    }

    return candidate
}

//: ✅ Test
print("Majority Element:", majorityElement([3,2,3]))         // Output: 3
print("Majority Element:", majorityElement([2,2,1,1,1,2,2])) // Output: 2

