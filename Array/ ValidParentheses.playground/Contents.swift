//: ## () Valid Parentheses (LeetCode #20)
//:
//: ### 💡 Stack-based matching

func isValid(_ s: String) -> Bool {
    var stack = [Character]()
    let matching: [Character: Character] = [")": "(", "]": "[", "}": "{"]

    for char in s {
        if matching.values.contains(char) {
            stack.append(char)
        } else if let expectedOpen = matching[char] {
            if stack.isEmpty || stack.removeLast() != expectedOpen {
                return false
            }
        }
    }

    return stack.isEmpty
}

//: ✅ Test Cases
print(isValid("()"))        // true
print(isValid("()[]{}"))    // true
print(isValid("(]"))        // false
print(isValid("([)]"))      // false
print(isValid("{[]}"))      // true

