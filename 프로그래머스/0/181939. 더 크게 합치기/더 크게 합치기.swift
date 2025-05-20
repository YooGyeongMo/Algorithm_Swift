import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    
    let ab: String = String(a) + String(b)
    let ba: String = String(b) + String(a)
    
    
    
    if Int(ab)! > Int(ba)! {
        return Int(ab)!
    } else if Int(ab)! < Int(ba)! {
        return Int(ba)!
    } else {
        return Int(ab)!
    }
}