import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0.reversed()))! }

print( input[0] < input[1] ? input[1] : input[0] )
