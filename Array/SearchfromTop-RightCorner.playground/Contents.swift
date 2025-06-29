//: ## 🔍 Search a 2D Matrix II (LeetCode #240)
//:
//: ### 💡 Start from top-right corner and eliminate rows/cols

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard !matrix.isEmpty else { return false }

    var row = 0
    var col = matrix[0].count - 1

    while row < matrix.count && col >= 0 {
        let val = matrix[row][col]
        if val == target {
            return true
        } else if val > target {
            col -= 1  // Move left
        } else {
            row += 1  // Move down
        }
    }

    return false
}

//: ✅ Test Case
let matrix = [
  [1, 4, 7, 11, 15],
  [2, 5, 8, 12, 19],
  [3, 6, 9, 16, 22],
  [10,13,14,17,24],
  [18,21,23,26,30]
]
print(searchMatrix(matrix, 5))   // Output: true
print(searchMatrix(matrix, 20))  // Output: false

