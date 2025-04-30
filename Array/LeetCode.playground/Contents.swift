//: ## 🔢 LeetCode Array Problems in Swift
//: Practicing some popular array problems with full explanations and solutions.
//: ----------------------------------------------------------

import Foundation

//: ## 1️⃣ Two Sum
//: - LeetCode #1
//: - Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to target.

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()  // number: index

    for (index, num) in nums.enumerated() {
        let complement = target - num
        if let compIndex = map[complement] {
            return [compIndex, index]
        }
        map[num] = index
    }
    return []
}

//: ✅ Test
print("Two Sum:", twoSum([2, 7, 11, 15], 9)) // Output: [0, 1]

//: ----------------------------------------------------------

//: ## 2️⃣ Remove Duplicates from Sorted Array
//: - LeetCode #26
//: - Given a sorted array `nums`, remove the duplicates in-place and return the new length.

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else { return nums.count }

    var index = 1
    for i in 1..<nums.count {
        if nums[i] != nums[i - 1] {
            nums[index] = nums[i]
            index += 1
        }
    }
    return index
}

//: ✅ Test
var sortedArray = [0,0,1,1,1,2,2,3,3,4]
let newLength = removeDuplicates(&sortedArray)
print("Remove Duplicates: length = \(newLength), result = \(Array(sortedArray.prefix(newLength)))")
// Output: length = 5, result = [0, 1, 2, 3, 4]

//: ----------------------------------------------------------

//: ## 3️⃣ Move Zeroes
//: - LeetCode #283
//: - Given an array, move all 0's to the end while maintaining the relative order of the non-zero elements.

func moveZeroes(_ nums: inout [Int]) {
    var insertPos = 0

    for num in nums where num != 0 {
        nums[insertPos] = num
        insertPos += 1
    }

    while insertPos < nums.count {
        nums[insertPos] = 0
        insertPos += 1
    }
}

//: ✅ Test
var zeroArray = [0,1,0,3,12]
moveZeroes(&zeroArray)
print("Move Zeroes:", zeroArray) // Output: [1, 3, 12, 0, 0]

//: ----------------------------------------------------------
