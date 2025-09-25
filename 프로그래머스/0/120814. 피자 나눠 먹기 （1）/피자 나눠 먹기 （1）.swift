import Foundation

func solution(_ n:Int) -> Int {
    
    let pizzaPiece: Int = 7
    
    let result: Double = Double(n) / Double(pizzaPiece)
    
    return Int(ceil(result))
}