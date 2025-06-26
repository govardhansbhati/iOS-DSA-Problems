//: ## 🎯 Number of Islands (LeetCode #200)
//:
//: ### 💡 BFS/DFS

/* Given an m x n 2D grid map, where '1' represents land and '0' represents water, count the number of islands.
 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. */


func numIslands(_ grid: [[Character]]) -> Int {
    var grid = grid
    let m = grid.count
    let n = grid[0].count
    var islands = 0
    
    func dfs(_ i: Int, _ j: Int) {
        // Check boundary conditions
        if i < 0 || i >= m || j < 0 || j >= n || grid[i][j] == "0" {
            return
        }
        
        // Mark current cell as visited
        grid[i][j] = "0"
        
        // Visit all connected land cells (up, down, left, right)
        dfs(i-1, j)  // up
        dfs(i+1, j)  // down
        dfs(i, j-1)  // left
        dfs(i, j+1)  // right
    }
    
    for i in 0..<m {
        for j in 0..<n {
            if grid[i][j] == "1" {  // Found unvisited land
                islands += 1
                dfs(i, j)  // Start DFS from this cell
            }
        }
    }
    
    return islands
}

//: ✅ Test Case
let grid: [[Character]] = [
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
]
print(numIslands(grid))  // Output: 1

