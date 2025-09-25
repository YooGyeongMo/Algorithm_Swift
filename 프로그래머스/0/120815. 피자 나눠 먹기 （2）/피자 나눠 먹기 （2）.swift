import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    }
    
    return gcd(b, a%b)
}

func solution(_ n:Int) -> Int {
    var pizza: Int
    let pizzaPiece: Int = 6
    
    pizza = n * pizzaPiece / gcd(n,pizzaPiece)
    
    return pizza / pizzaPiece
}