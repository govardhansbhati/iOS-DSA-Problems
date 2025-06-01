//: ## 3️⃣1️⃣ Spiral Matrix
//: - LeetCode #54
//: - Given an m x n matrix, return all elements of the matrix in spiral order.

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var result: [Int] = []
    var top = 0
    var bottom = matrix.count - 1
    var left = 0
    var right = matrix[0].count - 1

    while top <= bottom && left <= right {
        // Traverse from Left to Right
        for i in left...right {
            result.append(matrix[top][i])
        }
        top += 1

        // Traverse Downwards
        for i in top...bottom {
            result.append(matrix[i][right])
        }
        right -= 1

        // Traverse from Right to Left
        if top <= bottom {
            for i in stride(from: right, through: left, by: -1) {
                result.append(matrix[bottom][i])
            }
            bottom -= 1
        }

        // Traverse Upwards
        if left <= right {
            for i in stride(from: bottom, through: top, by: -1) {
                result.append(matrix[i][left])
            }
            left += 1
        }
    }

    return result
}

//: ✅ Test
let matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]
print("Spiral Order:", spiralOrder(matrix)) // Output: [1,2,3,6,9,8,7,4,5]

