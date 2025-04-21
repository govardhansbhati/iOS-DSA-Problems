import Foundation

/// A utility class to calculate minimum train platforms required using Greedy approach
class TrainPlatformCalculator {

    /// Calculates the minimum number of platforms needed so that no train waits
    /// - Parameters:
    ///   - arrivals: An array of train arrival times in 24-hour format (e.g., 900, 1030)
    ///   - departures: An array of train departure times in 24-hour format (e.g., 910, 1045)
    /// - Returns: Minimum number of platforms required
    func findMinimumPlatforms(arrivals: [Int], departures: [Int]) -> Int {
        guard arrivals.count == departures.count else { return 0 }

        // Step 1: Sort both arrays
        let sortedArrivals = arrivals.sorted()
        let sortedDepartures = departures.sorted()

        var platformsNeeded = 0
        var maxPlatforms = 0

        var i = 0  // pointer for arrivals
        var j = 0  // pointer for departures

        // Step 2: Traverse through all events
        while i < sortedArrivals.count && j < sortedDepartures.count {
            if sortedArrivals[i] <= sortedDepartures[j] {
                // One more train arrived → need a new platform
                platformsNeeded += 1
                i += 1
                maxPlatforms = max(maxPlatforms, platformsNeeded)
            } else {
                // One train departed → free up a platform
                platformsNeeded -= 1
                j += 1
            }
        }

        return maxPlatforms
    }
}

