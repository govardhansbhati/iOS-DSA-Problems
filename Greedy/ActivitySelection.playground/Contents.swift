import Foundation

// MARK: - 📄 Problem Statement

/*
 Activity Selection Problem

 Given N activities with their start and end times, select the maximum number
 of activities that can be performed by a single person, assuming that a person
 can only work on a single activity at a time.

 Example:
 Start times: [1, 3, 0, 5, 8, 5]
 End times:   [2, 4, 6, 7, 9, 9]

 Expected Output:
 4 activities can be performed: (0,1), (1,3), (3,4), (4,5)
*/


// MARK: - 🧱 Activity Model

struct Activity {
    let start: Int
    let end: Int
}

// MARK: - 🧠 Step-by-step Greedy Logic

/*
 1. Pair up all activities with their start and end time.
 2. Sort activities based on their end times (earliest ending first).
 3. Initialize the first activity as selected.
 4. For each next activity:
    - If its start time is >= last selected activity's end time,
      select it and update the end time.
*/


// MARK: - Input

let startTimes = [1, 3, 0, 5, 8, 5]
let endTimes =   [2, 4, 6, 7, 9, 9]

// Step 1: Create activity objects
var activities: [Activity] = zip(startTimes, endTimes).map { Activity(start: $0, end: $1) }

// Step 2: Sort by end time
activities.sort { $0.end < $1.end }


// MARK: - 💡 Greedy Selection

var selectedActivities: [Activity] = []

// First activity is always selected
if let first = activities.first {
    selectedActivities.append(first)
    var lastEnd = first.end

    // Step 3: Loop through rest
    for activity in activities.dropFirst() {
        if activity.start >= lastEnd {
            selectedActivities.append(activity)
            lastEnd = activity.end
        }
    }
}


// MARK: - ✅ Output

print("📊 Total Activities Selected: \(selectedActivities.count)\n")

for (index, activity) in selectedActivities.enumerated() {
    print("Activity \(index + 1): Start = \(activity.start), End = \(activity.end)")
}

