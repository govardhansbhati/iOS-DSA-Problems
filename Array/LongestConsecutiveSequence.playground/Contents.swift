//: ## 2️⃣7️⃣ Longest Consecutive Sequence
//: - LeetCode #128
//: - Given an unsorted array of integers `nums`, return the length of the longest consecutive elements sequence.
//: - You must write an algorithm that runs in O(n) time.

func longestConsecutive(_ nums: [Int]) -> Int {
    let numSet = Set(nums)
    var longest = 0

    for num in numSet {
        // Only start counting if it's the start of a sequence
        if !numSet.contains(num - 1) {
            var currentNum = num
            var streak = 1

            while numSet.contains(currentNum + 1) {
                currentNum += 1
                streak += 1
            }

            longest = max(longest, streak)
        }
    }

    return longest
}

//: ✅ Test
print("Longest Consecutive Sequence:", longestConsecutive([100, 4, 200, 1, 3, 2])) // Output: 4
print("Longest Consecutive Sequence:", longestConsecutive([0,3,7,2,5,8,4,6,0,1])) // Output: 9

