import Foundation

// MARK: - Model

/// Represents a person with a name and the time they take to cross the bridge.
struct Person {
    let name: String
    let time: Int
}

/// Represents a single step in the bridge crossing process.
struct Step {
    let description: String
    let timeTaken: Int
}

// MARK: - Setup People

let A = Person(name: "A", time: 1)
let B = Person(name: "B", time: 2)
let C = Person(name: "C", time: 5)
let D = Person(name: "D", time: 10)

// MARK: - Define the Optimal Strategy

/// We use A and B (the fastest) to shuttle the torch and minimize time.
let steps: [Step] = [
    Step(description: "1️⃣ A and B cross → (Time: \(max(A.time, B.time)))", timeTaken: max(A.time, B.time)),  // 2 min
    Step(description: "2️⃣ A returns → (Time: \(A.time))", timeTaken: A.time),                                // 1 min
    Step(description: "3️⃣ C and D cross → (Time: \(max(C.time, D.time)))", timeTaken: max(C.time, D.time)),  // 10 min
    Step(description: "4️⃣ B returns → (Time: \(B.time))", timeTaken: B.time),                                // 2 min
    Step(description: "5️⃣ A and B cross again → (Time: \(max(A.time, B.time)))", timeTaken: max(A.time, B.time)) // 2 min
]

// MARK: - Calculate Total Time

let totalTime = steps.reduce(0) { $0 + $1.timeTaken }

// MARK: - Output

print("🚧 Bridge Crossing Plan 🚧\n")
steps.forEach { print($0.description) }
print("\n⏱ Total Time Taken: \(totalTime) minutes")

