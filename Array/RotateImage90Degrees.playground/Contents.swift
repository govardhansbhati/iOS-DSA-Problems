//: ## 🔄 Rotate Image 90 Degrees (LeetCode #48)
//:
//: ### 💡 Transpose + Reverse approach

func rotate(_ matrix: inout [[Int]]) {
    let n = matrix.count
    
    // Transpose (swap i, j with j, i)
    for i in 0..<n {
        for j in i..<n {
            (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
        }
    }
    
    // Reverse each row
    for i in 0..<n {
        matrix[i].reverse()
    }
}

//: ✅ Test
var matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

rotate(&matrix)
print(matrix)
// Output: [[7,4,1],[8,5,2],[9,6,3]]

