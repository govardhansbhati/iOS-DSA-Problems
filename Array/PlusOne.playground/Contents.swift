//: ## 9️⃣ Plus One
//: - LeetCode #66
//: - You are given a large integer represented as an integer array `digits`, where each `digits[i]` is the i-th digit of the number.
//: - The digits are stored such that the most significant digit is at the head of the list.
//: - Increment the large integer by one and return the resulting array of digits.

func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    var i = digits.count - 1

    while i >= 0 {
        if digits[i] < 9 {
            digits[i] += 1
            return digits
        }
        digits[i] = 0
        i -= 1
    }

    // If all digits were 9, we need to add a 1 at the start
    return [1] + digits
}

//: ✅ Test
print("Plus One:", plusOne([1,2,3])) // Output: [1,2,4]
print("Plus One:", plusOne([9,9,9])) // Output: [1,0,0,0]

