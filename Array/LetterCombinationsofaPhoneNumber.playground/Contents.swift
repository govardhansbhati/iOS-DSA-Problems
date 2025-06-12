//: ## ☎️ LeetCode #17: Letter Combinations of a Phone Number
//:
//: ### 💡 Approach
//: - Use a dictionary to map digits to characters
//: - Use recursive backtracking to explore all combinations

func letterCombinations(_ digits: String) -> [String] {
    guard !digits.isEmpty else { return [] }

    let digitMap: [Character: [Character]] = [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]

    var result = [String]()
    var combination = ""

    func backtrack(_ index: Int) {
        if index == digits.count {
            result.append(combination)
            return
        }

        let currentDigit = digits[digits.index(digits.startIndex, offsetBy: index)]
        for letter in digitMap[currentDigit]! {
            combination.append(letter)
            backtrack(index + 1)
            combination.removeLast()
        }
    }

    backtrack(0)
    return result
}

//: ✅ Test Cases
print(letterCombinations("23"))
print(letterCombinations(""))      // Output: []
print(letterCombinations("2"))     // Output: ["a", "b", "c"]

