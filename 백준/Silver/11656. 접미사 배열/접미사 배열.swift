import Foundation

let str = readLine()!

var strArray: [Substring] = []

for i in 0..<str.count {
    let startIndex = str.index(str.startIndex, offsetBy: i)
    strArray.append(str[startIndex...])
//    print(type(of:str[startIndex...]))
}

for item in strArray.sorted(){
    print(item)
}


