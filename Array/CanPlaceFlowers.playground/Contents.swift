/*
 🌸 Problem: Can Place Flowers (LeetCode 605)

 Given a flowerbed array and a number `n`, return true if `n` new flowers can be planted
 in the flowerbed without violating the no-adjacent-flowers rule.
*/

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var bed = flowerbed
        var count = n

        for i in 0..<bed.count {
            if bed[i] == 0 {
                let emptyLeft = (i == 0) || (bed[i - 1] == 0)
                let emptyRight = (i == bed.count - 1) || (bed[i + 1] == 0)

                if emptyLeft && emptyRight {
                    bed[i] = 1
                    count -= 1
                    if count == 0 {
                        return true
                    }
                }
            }
        }

        return count <= 0
    }
}

// MARK: - Test Cases

let solution = Solution()
print(solution.canPlaceFlowers([1, 0, 0, 0, 1], 1)) // true
print(solution.canPlaceFlowers([1, 0, 0, 0, 1], 2)) // false

