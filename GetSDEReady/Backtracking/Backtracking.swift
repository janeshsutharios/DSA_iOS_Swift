// https://getsdeready.com/courses/dsa/lesson/binary-watch/
// https://leetcode.com/problems/binary-watch/
// Using recursion
func readBinaryWatch1(_ turnedOn: Int) -> [String] {
    var result: [String] = []

    func dfs(hour: Int, minute: Int) {
        // Base case: stop if out of bounds
        if hour >= 12 || minute >= 60 {
            return
        }

        // Check if current time has exactly `turnedOn` LEDs on
        if hour.nonzeroBitCount + minute.nonzeroBitCount == turnedOn {
            let time = "\(hour):" + String(format: "%02d", minute)
            result.append(time)
        }

        // Move to next minute
        if minute < 59 {
            dfs(hour: hour, minute: minute + 1)
        } else if hour < 11 {
            // Move to next hour and reset minute
            dfs(hour: hour + 1, minute: 0)
        }
    }

    dfs(hour: 0, minute: 0)
    return result
}
// Using loop
func readBinaryWatch(_ turnedOn: Int) -> [String] {
    var result: [String] = []
    
    // Loop through all possible hour and minute combinations
    for hour in 0..<12 {
        for minute in 0..<60 {
            // Count the total number of set bits (LEDs on)
            if hour.nonzeroBitCount + minute.nonzeroBitCount == turnedOn {
                // Format time string, minutes always with 2 digits
                let time = "\(hour):" + String(format: "%02d", minute)
                result.append(time)
            }
        }
    }
    
    return result
}
