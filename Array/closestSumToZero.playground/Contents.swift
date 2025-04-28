import UIKit

func closestSumToZero(_ nums: [Int]) -> (Int, Int)? {
    guard nums.count >= 2 else { return nil }
    
    let sortedNums = nums.sorted()
    var left = 0
    var right = sortedNums.count - 1
    
    var closestPair: (Int, Int) = (sortedNums[left], sortedNums[right])
    var closestSum = abs(sortedNums[left] + sortedNums[right])
    
    while left < right {
        let currentSum = sortedNums[left] + sortedNums[right]
        
        if abs(currentSum) < closestSum {
            closestSum = abs(currentSum)
            closestPair = (sortedNums[left], sortedNums[right])
        }
        
        if currentSum < 0 {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return closestPair
}
