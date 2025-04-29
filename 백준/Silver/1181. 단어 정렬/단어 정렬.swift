//
//  main.swift
//  알고리즘 연습
//
//  Created by Demian Yoo on 4/16/25.
//

import Foundation


let T = Int(readLine()!)!

var arr: [String] = []


for _ in 0..<T {
    arr.append(readLine()!)
}

// 정렬
arr = Array(Set(arr))

//
arr.sort {
    if $0.count == $1.count {
        return $0 < $1 // true라면 앞쪽으로 보낸다. false라면 뒤쪽으로 보낸다.
    }
    return $0.count < $1.count
}

// 출력
for word in arr {
    print(word)
}
