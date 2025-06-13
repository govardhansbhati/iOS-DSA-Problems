//: ## 🔠 Longest Substring Without Repeating Characters
//:
//: ### 💡 Sliding Window Approach with Set

func lengthOfLongestSubstring(_ s: String) -> Int {
    var charSet = Set<Character>()
    let chars = Array(s)
    var left = 0
    var maxLength = 0

    for right in 0..<chars.count {
        while charSet.contains(chars[right]) {
            charSet.remove(chars[left])
            left += 1
        }
        charSet.insert(chars[right])
        maxLength = max(maxLength, right - left + 1)
    }

    return maxLength
}

//: ✅ Test Case
let input = "abcabcbb"
print(lengthOfLongestSubstring(input))  // Output: 3

