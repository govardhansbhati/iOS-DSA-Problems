import UIKit
/*
 
 🧩 Problem Statement

 Write a Swift function that takes a string as input and returns a new string representing the count of each character, maintaining the order of their first appearance.

 ✅ Example
 Input: "aabaaccabb"
 Output: "a5b3c2"

 Explanation:
 Character 'a' appears 5 times
 Character 'b' appears 3 times
 Character 'c' appears 2 times
 We concatenate them in the order they first appear:
 → "a5b3c2"
 
 */

func characterCountString(from input: String) -> String {
    // Step 1: Create a dictionary to store the count of each character
    var charCount: [Character: Int] = [:]

    // Step 2: Create an array to store the order of first appearance of characters
    var seenOrder: [Character] = []

    // Step 3: Loop through each character in the input string
    for char in input {
        // Step 4: If this character is being seen for the first time
        if charCount[char] == nil {
            seenOrder.append(char) // Store it in seenOrder to maintain order
        }

        // Step 5: Increase the count of the character
        charCount[char, default: 0] += 1
    }

    // Step 6: Construct the final result string
    var result = ""
    for char in seenOrder {
        if let count = charCount[char] {
            result += "\(char)\(count)" // Append character and its count
        }
    }

    // Step 7: Return the final result string
    return result
}

let input = "aabaaccabb"
let output = characterCountString(from: input)
print(output) // Output: "a5b3c2"
