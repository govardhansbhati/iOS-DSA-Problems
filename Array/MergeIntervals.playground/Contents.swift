//:  Merge Intervals

//: - Given an array of intervals where intervals[i] = [start_i, end_i], merge all overlapping intervals,
//:   and return an array of the non-overlapping intervals that cover all the intervals in the input.

func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard intervals.count > 1 else { return intervals }

    let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
    var merged: [[Int]] = [sortedIntervals[0]]

    for current in sortedIntervals[1...] {
        var last = merged.removeLast()
        if current[0] <= last[1] {
            last[1] = max(last[1], current[1])
            merged.append(last)
        } else {
            merged.append(last)
            merged.append(current)
        }
    }

    return merged
}

//: ✅ Test
print("Merged Intervals:", merge([[1,3],[2,6],[8,10],[15,18]])) // Output: [[1,6],[8,10],[15,18]]
print("Merged Intervals:", merge([[1,4],[4,5]]))               // Output: [[1,5]]

