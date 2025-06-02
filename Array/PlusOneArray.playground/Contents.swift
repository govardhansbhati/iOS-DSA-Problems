//: ## ➕ LeetCode #66: Plus One
//:
//: ### 🧩 Problem
//: You are given a large integer represented as an array of digits,
//: where each element in the array contains a single digit.
//: The digits are ordered such that the most significant digit comes first.
//:
//: Write a function that increments the integer by one and returns
//: the resulting array of digits.
//:
//: ### 🧪 Examples:
//: - Input: [1, 2, 3] → Output: [1, 2, 4]
//: - Input: [9, 9, 9] → Output: [1, 0, 0, 0]
//:
//: ### 🧠 Approach:
//: - Start from the last digit (least significant).
//: - If the digit is less than 9, increment and return.
//: - If the digit is 9, set it to 0 and continue to the next digit.
//: - If all digits are 9 (e.g., [9, 9, 9]), prepend 1 at the beginning.

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

    // All digits were 9, e.g., [9, 9, 9]
    digits.insert(1, at: 0)
    return digits
}

//: ✅ Test Cases
print(plusOne([1, 2, 3]))  // [1, 2, 4]
print(plusOne([9, 9, 9]))  // [1, 0, 0, 0]
print(plusOne([0]))        // [1]

