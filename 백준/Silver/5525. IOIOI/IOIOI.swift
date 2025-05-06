import Foundation

// 1. 패턴 만들기: "IOI"가 N번 반복된 PN
func makePattern(n: Int) -> String {
    var pattern = "I"
    for _ in 0..<n {
        pattern += "OI"
    }
    return pattern
}

// 2. 접두사 배열 (pi 배열) 생성
func makePi(_ pattern: String) -> [Int] {
    let p = Array(pattern)
    var pi = Array(repeating: 0, count: p.count)
    var j = 0
    
    for i in 1..<p.count {
        while j > 0 && p[i] != p[j] {
            j = pi[j - 1]
        }
        if p[i] == p[j] {
            j += 1
            pi[i] = j
        }
    }
    return pi
}

// 3. KMP 매칭
func kmp(_ text: String, _ pattern: String) -> Int {
    let t = Array(text)
    let p = Array(pattern)
    let pi = makePi(pattern)
    
    var j = 0
    var count = 0
    
    for i in 0..<t.count {
        while j > 0 && t[i] != p[j] {
            j = pi[j - 1]
        }
        if t[i] == p[j] {
            if j == p.count - 1 {
                count += 1
                j = pi[j]
            } else {
                j += 1
            }
        }
    }
    return count
}

// 4. 메인 실행
let N = Int(readLine()!)!
let _ = Int(readLine()!)!        // S의 길이는 안 써도 됨
let S = readLine()!

let pattern = makePattern(n: N)
let result = kmp(S, pattern)
print(result)