import Foundation

// MARK: - 📘 Problem Statement

/*
 Fractional Knapsack Problem

 Given weights and values of N items, put these items (or fractions of them)
 into a knapsack of capacity W to get the maximum total value in the knapsack.

 Unlike the 0/1 Knapsack, you are allowed to take the fraction of an item.

 Example:
 Values:  [60, 100, 120]
 Weights: [10, 20, 30]
 Capacity: 50

 You can take:
 - full item 1 (20 weight, value 100)
 - full item 0 (10 weight, value 60)
 - 2/3 of item 2 (20 weight, value 80)

 Total value = 240
*/


// MARK: - 🧱 Item Model

struct Item {
    let value: Double
    let weight: Double
    
    // Value-to-weight ratio
    var ratio: Double {
        return value / weight
    }
}

// MARK: - 🔢 Input Data

let values: [Double] = [60, 100, 120]
let weights: [Double] = [10, 20, 30]
let capacity: Double = 50

// Step 1: Pair values and weights
var items: [Item] = zip(values, weights).map { Item(value: $0, weight: $1) }

// Step 2: Sort items by highest value-to-weight ratio
items.sort { $0.ratio > $1.ratio }

// MARK: - 🧠 Greedy Algorithm

var remainingCapacity = capacity
var totalValue: Double = 0.0

for item in items {
    if remainingCapacity == 0 {
        break
    }
    
    if item.weight <= remainingCapacity {
        // Take the whole item
        totalValue += item.value
        remainingCapacity -= item.weight
        print("Taken full item: Value = \(item.value), Weight = \(item.weight)")
    } else {
        // Take the fraction of the item
        let fraction = remainingCapacity / item.weight
        let valueTaken = item.value * fraction
        totalValue += valueTaken
        print("Taken fraction (\(String(format: "%.2f", fraction))) of item: Value = \(valueTaken), Weight = \(remainingCapacity)")
        remainingCapacity = 0
    }
}

// MARK: - ✅ Output

print("\n🎯 Total value in knapsack: \(String(format: "%.2f", totalValue))")

