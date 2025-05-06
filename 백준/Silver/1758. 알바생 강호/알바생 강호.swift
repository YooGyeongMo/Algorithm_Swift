import Foundation


// 원래 주려고 했던돈 -(받은 등수 - 1) 만큼 팁을 강호에게 준다.
// 음수는 0
// 제일 많이 받는 법은 가장 큰수가 앞에 오고 0등으로 오는법이다.
let n = Int(readLine()!)!

var numbers: [Int] = []

for _ in 0..<n {
    let num = Int(readLine()!)!
    numbers.append(num)
}

numbers.sort(by:>) // 내림차순

var maxTip = 0

for (idx,tip) in numbers.enumerated() {
    let takeTip = tip - idx
    if takeTip > 0 {
        maxTip += takeTip
    }
}

print(maxTip)
