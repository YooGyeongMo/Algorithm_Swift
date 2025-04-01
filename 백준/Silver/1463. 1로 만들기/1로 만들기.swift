import Foundation

var n: Int = Int(readLine()!)!

func minValue(_ a: Int, _ b: Int) -> Int {
    return a < b ? a : b
}

var dp: [Int] = Array(repeating: 0, count: n+1)

if n == 1 {
    print(0)
    exit(0)
}

for i in 2...n {
    //무조건 한 번 더하는 것.
    dp[i] = dp[i-1] + 1

    if i % 2 == 0 {
        dp[i] = minValue(dp[i], dp[i/2]+1)
    }
    
    if i % 3 == 0 {
        dp[i] = minValue(dp[i], dp[i/3]+1)
    }
}

print(dp[n])