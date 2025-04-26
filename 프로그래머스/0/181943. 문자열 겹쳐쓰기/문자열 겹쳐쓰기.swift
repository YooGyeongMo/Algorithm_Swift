import Foundation

func solution( _ myString: String, _ overwriteString: String, _ s: Int) -> String {
    
    var startStr = myString.prefix(s)
    var middleStr = overwriteString
    var endStr = myString.suffix(myString.count - (s + overwriteString.count))
    
    
    return startStr + middleStr + endStr
    
}