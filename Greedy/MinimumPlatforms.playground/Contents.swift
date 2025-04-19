import Foundation

// MARK: - 📘 Problem Statement
/*
 Minimum Number of Platforms Required (Greedy)

 Given arrival and departure times of trains, find the minimum number of platforms
 required at the station so that no train waits.

 Input:
    Arrivals  = [900, 940, 950, 1100, 1500, 1800]
    Departures = [910, 1200, 1120, 1130, 1900, 2000]

 Output:
    Minimum platforms required = 3
*/


// MARK: - 🔢 Input Data

var arrivals = [900, 940, 950, 1100, 1500, 1800]
var departures = [910, 1200, 1120, 1130, 1900, 2000]

// Step 1: Sort both arrays
arrivals.sort()
departures.sort()

// Step 2: Initialize pointers and counters
var platformsNeeded = 0
var maxPlatforms = 0
var i = 0, j = 0
let n = arrivals.count

// Step 3: Traverse arrival and departure arrays
while i < n && j < n {
    if arrivals[i] <= departures[j] {
        platformsNeeded += 1
        i += 1
    } else {
        platformsNeeded -= 1
        j += 1
    }
    maxPlatforms = max(maxPlatforms, platformsNeeded)
}

// MARK: - ✅ Output

print("🚉 Minimum number of platforms required: \(maxPlatforms)")

