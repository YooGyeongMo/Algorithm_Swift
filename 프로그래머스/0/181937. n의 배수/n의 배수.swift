import Foundation

func solution(_ num:Int, _ n:Int) -> Int {
    return num % n == 0 ? 1 : 0
    // print(num.isMultiple(of: n))  // true
}