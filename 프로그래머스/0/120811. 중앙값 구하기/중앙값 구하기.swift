import Foundation

func solution(_ array:[Int]) -> Int {
    
    let arr = array.sorted()
    let result = Int(arr.count/2)
    
    return arr[result]
}