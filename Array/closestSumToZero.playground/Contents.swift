//: ## 🧠 Problem: Find Pair With Sum Closest to Zero
//:
//: You are given an array of integers. Your task is to find two numbers
//: such that their sum is closest to zero, and return that pair and their sum.
//:
//: ### 🧾 Example:
//: Input: [-8, 4, 5, -10, 3]
//: Output: Pair = (-8, 5), Sum = -3
//:
//: ---
//: ## Solution 1: Brute Force Approach
//:
//: Time Complexity: O(n^2)
//: Space Complexity: O(1)

import Foundation

func closestToZeroBruteForce(_ arr: [Int]) -> ((Int, Int), Int)? {
    guard arr.count >= 2 else { return nil }

    var closestSum = Int.max
    var resultPair: (Int, Int)? = nil

    for i in 0..<arr.count {
        for j in (i + 1)..<arr.count {
            let sum = arr[i] + arr[j]
            if abs(sum) < abs(closestSum) {
                closestSum = sum
                resultPair = (arr[i], arr[j])
            }
        }
    }

    if let pair = resultPair {
        return (pair, closestSum)
    }
    return nil
}

//: ---
//: ##  Solution 2: Two Pointer Approach
//:
//: Time Complexity: O(n log n) → due to sorting
//: Space Complexity: O(1)

func closestToZeroTwoPointer(_ arr: [Int]) -> ((Int, Int), Int)? {
    guard arr.count >= 2 else { return nil }

    let sortedArr = arr.sorted()
    var left = 0
    var right = sortedArr.count - 1

    var closestSum = Int.max
    var resultPair: (Int, Int)? = nil

    while left < right {
        let sum = sortedArr[left] + sortedArr[right]

        if abs(sum) < abs(closestSum) {
            closestSum = sum
            resultPair = (sortedArr[left], sortedArr[right])
        }

        if sum < 0 {
            left += 1
        } else {
            right -= 1
        }
    }

    if let pair = resultPair {
        return (pair, closestSum)
    }
    return nil
}

//: ---
//: ## Test and Compare Both Approaches

let testArray = [-8, 4, 5, -10, 3]

if let (pair1, sum1) = closestToZeroBruteForce(testArray) {
    print("Brute Force → Pair: \(pair1.0), \(pair1.1) | Sum: \(sum1)")
} else {
    print("Brute Force → Not enough elements")
}

if let (pair2, sum2) = closestToZeroTwoPointer(testArray) {
    print("Two Pointer → Pair: \(pair2.0), \(pair2.1) | Sum: \(sum2)")
} else {
    print("Two Pointer → Not enough elements")
}

//: You can experiment by changing the input array.

