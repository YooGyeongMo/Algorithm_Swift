import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    
    let ab = Int("\(a)\(b)")!
    let ba = 2*a*b
    
    
    return max(ab, ba)
}