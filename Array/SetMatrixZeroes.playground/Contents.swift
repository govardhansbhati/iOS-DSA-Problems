//: ## 3️⃣0️⃣ Set Matrix Zeroes
//: - LeetCode #73
//: - Given an m x n integer matrix, if an element is 0, set its entire row and column to 0.
//: - Do it in-place with constant space complexity if possible.

func setZeroes(_ matrix: inout [[Int]]) {
    let rows = matrix.count
    let cols = matrix[0].count
    var firstRowHasZero = false
    var firstColHasZero = false

    // Check if first row has zero
    for j in 0..<cols {
        if matrix[0][j] == 0 {
            firstRowHasZero = true
            break
        }
    }

    // Check if first column has zero
    for i in 0..<rows {
        if matrix[i][0] == 0 {
            firstColHasZero = true
            break
        }
    }

    // Use first row and column as markers
    for i in 1..<rows {
        for j in 1..<cols {
            if matrix[i][j] == 0 {
                matrix[i][0] = 0
                matrix[0][j] = 0
            }
        }
    }

    // Set zeroes based on markers
    for i in 1..<rows {
        for j in 1..<cols {
            if matrix[i][0] == 0 || matrix[0][j] == 0 {
                matrix[i][j] = 0
            }
        }
    }

    // Set first row and column
    if firstRowHasZero {
        for j in 0..<cols {
            matrix[0][j] = 0
        }
    }
    if firstColHasZero {
        for i in 0..<rows {
            matrix[i][0] = 0
        }
    }
}

//: ✅ Test
var matrix1 = [
    [1,1,1],
    [1,0,1],
    [1,1,1]
]
setZeroes(&matrix1)
print("Matrix After Zeroing:\n", matrix1)
// Output: [[1,0,1],[0,0,0],[1,0,1]]

