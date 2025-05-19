import Foundation

func solution(_ str1:String, _ str2:String) -> String {
    
    var result = ""
    
    let aArr = Array(str1)
    let bArr = Array(str2)
    
    for i in 0..<str1.count {
        result += String(aArr[i])
        result += String(bArr[i])
    }
    
    return result
}