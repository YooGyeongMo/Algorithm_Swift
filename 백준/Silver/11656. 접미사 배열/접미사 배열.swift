import Foundation

let str = readLine()!

var strArray: [String] = [str]

for i in 1..<str.count {
    let startIndex = str.index(str.startIndex, offsetBy: i)
    let substring = String(str[startIndex...])
    strArray.append(substring)
}

for item in strArray.sorted(){
    print(item)
}
