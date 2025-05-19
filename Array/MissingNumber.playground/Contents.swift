func missingNumber(_ nums: [Int]) -> Int {
    let n = nums.count
    let expectedSum = n * (n + 1) / 2
    let actualSum = nums.reduce(0, +)
    return expectedSum - actualSum
}

// ✅ Test
print("Missing Number:", missingNumber([3,0,1])) // Output: 2

