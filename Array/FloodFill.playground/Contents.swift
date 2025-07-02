//: ## 🎨 Flood Fill (LeetCode #733)
//:
/* Problem Statement:
 
 You are given an image represented by a 2D array of integers. Each integer represents a pixel value.

 You’re also given a starting pixel (sr, sc) and a new color.
 Replace the starting pixel and all connected pixels (4-directionally: up/down/left/right) that have the same color with the new color. */
//: ### 💡 DFS-based region coloring

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    var image = image
    let originalColor = image[sr][sc]
    let rows = image.count, cols = image[0].count

    if originalColor == newColor { return image }

    func dfs(_ r: Int, _ c: Int) {
        guard r >= 0, r < rows, c >= 0, c < cols else { return }
        if image[r][c] != originalColor { return }

        image[r][c] = newColor

        dfs(r + 1, c)
        dfs(r - 1, c)
        dfs(r, c + 1)
        dfs(r, c - 1)
    }

    dfs(sr, sc)
    return image
}

//: ✅ Test Case
let result = floodFill(
    [[1,1,1],
     [1,1,0],
     [1,0,1]], 1, 1, 2)

print(result)
// Output: [
//   [2,2,2],
//   [2,2,0],
//   [2,0,1]
// ]

