//: ## 🌀 Spiral Matrix Traversal (LeetCode #54)
//:
//: ### 💡 Traverse boundaries and shrink them inwards after each loop.

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var result = [Int]()
    guard !matrix.isEmpty else { return result }

    var top = 0
    var bottom = matrix.count - 1
    var left = 0
    var right = matrix[0].count - 1

    while top <= bottom && left <= right {
        // Traverse left to right
        for col in left...right {
            result.append(matrix[top][col])
        }
        top += 1

        // Traverse top to bottom
        for row in top...bottom {
            result.append(matrix[row][right])
        }
        right -= 1

        if top <= bottom {
            // Traverse right to left
            for col in stride(from: right, through: left, by: -1) {
                result.append(matrix[bottom][col])
            }
            bottom -= 1
        }

        if left <= right {
            // Traverse bottom to top
            for row in stride(from: bottom, through: top, by: -1) {
                result.append(matrix[row][left])
            }
            left += 1
        }
    }

    return result
}

//: ✅ Test Case
let inputMatrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]
print(spiralOrder(inputMatrix)) // [1, 2, 3, 6, 9, 8, 7, 4, 5]

