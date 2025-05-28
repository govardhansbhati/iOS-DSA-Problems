//: ## 2️⃣9️⃣ Insert Interval
//: - LeetCode #57
//: - You are given an array of non-overlapping intervals sorted by their start time,
//:   and a new interval to insert into the array.
//: - Insert the new interval so that the result remains a set of non-overlapping intervals sorted by start time.

func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    var i = 0
    let n = intervals.count

    // Add all intervals before newInterval
    while i < n && intervals[i][1] < newInterval[0] {
        result.append(intervals[i])
        i += 1
    }

    // Merge overlapping intervals
    var merged = newInterval
    while i < n && intervals[i][0] <= merged[1] {
        merged[0] = min(merged[0], intervals[i][0])
        merged[1] = max(merged[1], intervals[i][1])
        i += 1
    }
    result.append(merged)

    // Add remaining intervals
    while i < n {
        result.append(intervals[i])
        i += 1
    }

    return result
}

//: ✅ Test
print("Insert Interval Result:", insert([[1,3],[6,9]], [2,5]))      // Output: [[1,5],[6,9]]
print("Insert Interval Result:", insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])) // Output: [[1,2],[3,10],[12,16]]

