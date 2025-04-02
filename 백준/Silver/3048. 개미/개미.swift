//
//  main.swift
//  practice
//
//  Created by Demian Yoo on 4/2/25.
//

import Foundation

let groupCount = readLine()!.split(separator: " ").map { Int ($0)!}

var a: Int = groupCount[0]
var b: Int = groupCount[1]

let aString: String = String(readLine()!.reversed())
let bString: String = readLine()!

let sec: Int = Int(readLine()!)!


var ant: [Character] = Array(aString + bString)
var group = Array(repeating: true, count: a) + Array(repeating: false, count: b)

if sec == 0 {
    print(String(ant))
    exit(0)
}

for _ in 0..<sec {
    var i = 0
    while i < ant.count - 1 {
        // 마주치는 경우
        if group[i] == true && group[i+1] == false {
//            (ant[i], ant[i+1]) = swap(ant[i], ant[i+1])
            (ant[i], ant[i+1]) = (ant[i+1], ant[i])
            (group[i], group[i+1]) = (group[i+1], group[i])
            i += 2 // 점프한 개미는 건너뛰기
        } else {
            i += 1
        }
    }
}

print(String(ant))


