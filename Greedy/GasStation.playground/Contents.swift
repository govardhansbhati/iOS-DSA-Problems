import Foundation

// MARK: - 📘 Problem Statement
/*
 Gas Station (Circular Route)

 You're given 2 arrays:
    - gas[i]: Fuel available at station i
    - cost[i]: Fuel needed to reach next station from i

 Return the index of the starting station where you can travel around the circle once.
 Return -1 if not possible.

 Input:
    gas  = [1, 2, 3, 4, 5]
    cost = [3, 4, 5, 1, 2]

 Output:
    Start at station index: 3
*/


// MARK: - 🔢 Input

let gas = [1, 2, 3, 4, 5]
let cost = [3, 4, 5, 1, 2]

func canCompleteCircuit(gas: [Int], cost: [Int]) -> Int {
    let n = gas.count
    var totalTank = 0
    var currTank = 0
    var startIndex = 0

    for i in 0..<n {
        let diff = gas[i] - cost[i]
        totalTank += diff
        currTank += diff

        // Can't reach next station, restart from next index
        if currTank < 0 {
            startIndex = i + 1
            currTank = 0
        }
    }

    return totalTank >= 0 ? startIndex : -1
}

// MARK: - ✅ Output

let startStation = canCompleteCircuit(gas: gas, cost: cost)
print(startStation == -1
    ? "❌ Not possible to complete the circular tour"
    : "✅ Start at station index: \(startStation)")

