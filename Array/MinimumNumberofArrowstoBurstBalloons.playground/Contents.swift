//: ## 🎯 Minimum Number of Arrows to Burst Balloons (LeetCode #452)
//: Problem Statement:

/*There are n balloons, each represented as a horizontal interval on the x-axis (i.e., [[xStart, xEnd]]).
You need to shoot as few arrows as possible to burst all balloons.
An arrow can be shot vertically at any point x, and it will burst all balloons whose interval includes x.*/
//: ### 💡 Greedy + Interval Sorting

func findMinArrowShots(_ points: [[Int]]) -> Int {
    guard !points.isEmpty else { return 0 }

    // Sort by end of intervals
    let sortedPoints = points.sorted { $0[1] < $1[1] }
    var arrows = 1
    var arrowPos = sortedPoints[0][1]
    
    for point in sortedPoints {
        if point[0] > arrowPos {
            arrows += 1
            arrowPos = point[1]
        }
    }
    
    return arrows
}

//: ✅ Test Case
let balloons = [[10,16],[2,8],[1,6],[7,12]]
print(findMinArrowShots(balloons))  // Output: 2

