import Foundation

func solution() {
    let testCase = Int(readLine()!)!
    var dp = Array(repeating:0, count:11)
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    
    for i in 4..<11 {
        dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
    }
    
    for _ in 0..<testCase {
        let n = Int(readLine()!)!
        print(dp[n])
    }
}

solution()