import Foundation

/*
 🧨 Problem: Bomb Enemy (LeetCode - Medium)

 You are given a 2D grid of characters representing a map where:
 - 'W' represents a wall
 - 'E' represents an enemy
 - '0' represents an empty cell

 A bomb can be placed in any empty cell. When a bomb is placed, it will eliminate all enemies in the same row and column until it hits a wall ('W').

 Your task is to return the maximum number of enemies you can eliminate with a single bomb.

 🔸 Example:
 Input:
 [
   ["0","E","0","0"],
   ["E","0","W","E"],
   ["0","E","0","0"]
 ]

 Output: 3

 Explanation:
 Placing a bomb at cell (1,1) eliminates enemies at (0,1), (1,0), and (2,1), totaling 3 enemies.

 --------------------------------------------------

 🧠 Approach:

 1. Iterate through the grid row by row and column by column.
 2. For each row, recalculate the number of enemies to the right of a wall or at the beginning of the row.
 3. For each column, recalculate the number of enemies below a wall or at the beginning of the column.
 4. For each empty cell '0', sum the row and column enemy counts.
 5. Keep track of the maximum number of enemies that can be killed.

 ✅ Time Complexity: O(m * n)
 ✅ Space Complexity: O(n) – for storing column hits

*/

class Solution {
    func maxKilledEnemies(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty, !grid[0].isEmpty else { return 0 }

        let m = grid.count
        let n = grid[0].count
        var maxEnemies = 0

        var rowHits = 0
        var colHits = Array(repeating: 0, count: n)

        for i in 0..<m {
            for j in 0..<n {
                // Recalculate rowHits when at the first column or after a wall
                if j == 0 || grid[i][j - 1] == "W" {
                    rowHits = 0
                    var k = j
                    while k < n && grid[i][k] != "W" {
                        if grid[i][k] == "E" {
                            rowHits += 1
                        }
                        k += 1
                    }
                }

                // Recalculate colHits[j] when at the first row or after a wall
                if i == 0 || grid[i - 1][j] == "W" {
                    colHits[j] = 0
                    var k = i
                    while k < m && grid[k][j] != "W" {
                        if grid[k][j] == "E" {
                            colHits[j] += 1
                        }
                        k += 1
                    }
                }

                // If the cell is empty, calculate total enemies killed
                if grid[i][j] == "0" {
                    maxEnemies = max(maxEnemies, rowHits + colHits[j])
                }
            }
        }

        return maxEnemies
    }
}

// MARK: - Test Example

let grid: [[Character]] = [
    ["0", "E", "0", "0"],
    ["E", "0", "W", "E"],
    ["0", "E", "0", "0"]
]

let solution = Solution()
let result = solution.maxKilledEnemies(grid)
print("💥 Maximum enemies killed with one bomb: \(result)")
