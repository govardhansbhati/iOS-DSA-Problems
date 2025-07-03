//: ## 🔁 Decode String (LeetCode #394)
//:
//: ### 💡 Stack-based decoding of nested patterns
/*Problem Statement:
 
 Given an encoded string, return its decoded version.
 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is repeated k times.

 You may assume that the input is always valid and well-formed.*/
func decodeString(_ s: String) -> String {
    var numStack = [Int]()
    var strStack = [String]()
    var currentNum = 0
    var currentStr = ""

    for char in s {
        if char.isNumber {
            currentNum = currentNum * 10 + Int(String(char))!
        } else if char == "[" {
            numStack.append(currentNum)
            strStack.append(currentStr)
            currentNum = 0
            currentStr = ""
        } else if char == "]" {
            let repeatCount = numStack.removeLast()
            let previousStr = strStack.removeLast()
            currentStr = previousStr + String(repeating: currentStr, count: repeatCount)
        } else {
            currentStr += String(char)
        }
    }

    return currentStr
}

//: ✅ Test Cases
print(decodeString("3[a]2[bc]"))      // Output: "aaabcbc"
print(decodeString("3[a2[c]]"))       // Output: "accaccacc"
print(decodeString("2[abc]3[cd]ef"))  // Output: "abcabccdcdcdef"

