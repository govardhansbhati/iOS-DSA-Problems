import Foundation

// MARK: - 📘 Problem Statement
/*
 Job Sequencing Problem (Greedy)

 Each job has an ID, a deadline, and a profit. One job can be scheduled at a time.
 Schedule jobs to maximize profit while ensuring no overlapping jobs.

 Input:
    Jobs = [
        (id: "A", deadline: 2, profit: 100),
        (id: "B", deadline: 1, profit: 19),
        (id: "C", deadline: 2, profit: 27),
        (id: "D", deadline: 1, profit: 25),
        (id: "E", deadline: 3, profit: 15)
    ]

 Output:
    Jobs scheduled: A, C, E
    Total profit: 142
 */


// MARK: - 🧱 Job Model

struct Job {
    let id: String
    let deadline: Int
    let profit: Int
}

// MARK: - 🔢 Input

let jobs: [Job] = [
    Job(id: "A", deadline: 2, profit: 100),
    Job(id: "B", deadline: 1, profit: 19),
    Job(id: "C", deadline: 2, profit: 27),
    Job(id: "D", deadline: 1, profit: 25),
    Job(id: "E", deadline: 3, profit: 15)
]

// Step 1: Sort jobs by descending profit
let sortedJobs = jobs.sorted { $0.profit > $1.profit }

// Step 2: Find maximum deadline
let maxDeadline = sortedJobs.map { $0.deadline }.max() ?? 0

// Track time slots, false = empty
var slots = Array(repeating: false, count: maxDeadline)
var scheduledJobs = Array(repeating: "", count: maxDeadline)
var totalProfit = 0

// Step 3: Try placing each job in latest possible slot
for job in sortedJobs {
    for slot in stride(from: min(maxDeadline, job.deadline) - 1, through: 0, by: -1) {
        if !slots[slot] {
            slots[slot] = true
            scheduledJobs[slot] = job.id
            totalProfit += job.profit
            break
        }
    }
}

// MARK: - ✅ Output

print("🛠 Jobs scheduled (in order): \(scheduledJobs.filter { !$0.isEmpty }.joined(separator: ", "))")
print("💰 Total Profit: \(totalProfit)")

