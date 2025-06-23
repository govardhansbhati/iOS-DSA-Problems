//: ## 🎯 Combination Sum (LeetCode #39)
//:Problem Statement:

/*   Given a set of candidate numbers candidates (without duplicates) and a target number target, find all unique combinations in candidates where the chosen numbers sum to target.
You may use the same number unlimited times. */
//: ### 💡 Backtracking with multiple usage of same element

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    var path = [Int]()

    func backtrack(_ start: Int, _ remaining: Int) {
        if remaining == 0 {
            result.append(path)
            return
        }
        if remaining < 0 {
            return
        }
        
        for i in start..<candidates.count {
            path.append(candidates[i])
            backtrack(i, remaining - candidates[i])
            path.removeLast()
        }
    }
    
    backtrack(0, target)
    return result
}

//: ✅ Test Case
let candidates = [2,3,6,7]
let target = 7
print(combinationSum(candidates, target))

