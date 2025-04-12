import UIKit
import Foundation

/// Finds the second largest number in an array of integers.
///
/// - Parameter array: An array of integers.
/// - Returns: The second largest number if available, otherwise `nil`.

func secondLargest(in array: [Int]) -> Int? {
    // Step 1: Handle edge case where there are fewer than 2 elements
    guard array.count >= 2 else { return nil }

    // Step 2: Initialize two variables to track the largest and second largest values
    var largest = Int.min
    var secondLargest = Int.min

    // Step 3: Iterate through each number in the array
    for number in array {
        if number > largest {
            // If current number is greater than the current largest:
            // - Update secondLargest to the current largest
            // - Update largest to the current number
            secondLargest = largest
            largest = number
        } else if number > secondLargest && number != largest {
            // If current number is not equal to largest but greater than secondLargest:
            // - Update secondLargest
            secondLargest = number
        }
    }

    // Step 4: If secondLargest is still Int.min, it means no valid second largest was found (e.g., all elements equal)
    return secondLargest == Int.min ? nil : secondLargest
}

let array1 = [12, 5, 8, 12, 7, 9]
let array2 = [4, 4, 4]
let array3 = [9]

if let result1 = secondLargest(in: array1) {
    print("Second largest in array1: \(result1)") // Output: 9
} else {
    print("No second largest number found in array1.")
}

if let result2 = secondLargest(in: array2) {
    print("Second largest in array2: \(result2)")
} else {
    print("No second largest number found in array2.") // All elements are equal
}

if let result3 = secondLargest(in: array3) {
    print("Second largest in array3: \(result3)")
} else {
    print("No second largest number found in array3.") // Only one element
}
