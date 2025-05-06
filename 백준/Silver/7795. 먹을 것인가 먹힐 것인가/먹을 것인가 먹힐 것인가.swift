import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let nm = readLine()!.split(separator: " ").map {Int($0)!}
    let N = nm[0], M = nm[1]
    
    let A = readLine()!.split(separator:" ").map { Int($0)!}
    let B = readLine()!.split(separator:" ").map { Int($0)!}.sorted()
    
    var count = 0
    for found in A {
        count += check(B, found)
    }
    print(count)
}

func check(_ arr: [Int], _ target: Int) -> Int {
    var left = 0
    var right = arr.count
    
    while left < right {
        let mid = (left + right) / 2
        if arr[mid] < target {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return left
}
