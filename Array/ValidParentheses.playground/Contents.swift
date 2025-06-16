//: ## 🧱 Valid Parentheses (LeetCode #20)
//:
//: ### 💡 Use stack to track open brackets and match them correctly

func isValid(_ s: String) -> Bool {
    var stack = [Character]()
    let matching: [Character: Character] = [")": "(", "}": "{", "]": "["]

    for char in s {
        if let expected = matching[char] {
            // Check top of stack
            if stack.isEmpty || stack.removeLast() != expected {
                return false
            }
        } else {
            stack.append(char)
        }
    }

    return stack.isEmpty
}

//: ✅ Test Cases
print(isValid("()[]{}"))  // true
print(isValid("(]"))      // false
print(isValid("{[]}"))    // true

