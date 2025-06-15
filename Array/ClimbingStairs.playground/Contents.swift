//: ## 🧩 Climbing Stairs (LeetCode #70)
//:
//: ### 💡 Dynamic Programming Solution

func climbStairs(_ n: Int) -> Int {
    guard n > 1 else { return n }

    var first = 1, second = 2
    for _ in 3...n {
        let temp = first + second
        first = second
        second = temp
    }
    
    return second
}

//: ✅ Test Case
let steps = 5
print(climbStairs(steps))  // Output: 8

