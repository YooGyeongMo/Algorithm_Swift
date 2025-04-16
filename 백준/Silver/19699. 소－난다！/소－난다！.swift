//
//  main.swift
//  practice
//
//  Created by Demian Yoo on 4/16/25.
//

/*
1. 소수 구하기 함수
 어떤 수가 합성수라면 반드시 그 수의 약수 중 하나는 제곱근 이하에 존재한다.
 그래서 소수 판별은 제곱근까지만 검사하면된다.

2.
 */

import Foundation


extension Array {
    func makeMap<T>(_ transform: (Element)-> T?)->[T] {
        var result: [T] = []
        for element in self {
            if let value: T = transform(element) {
                result.append(value)
            }
        }
        return result
    }
    
    func asTuple() -> (Element, Element)? {
        guard self.count == 2 else { return nil }
        return (self[0], self[1])
    }
}

guard let (N, M) = readLine()!.split(separator: " ").makeMap({ Int($0) }).asTuple() else { exit(1) }

var inputArr: [Int] = readLine()!.split(separator: " ").makeMap{ Int($0) }


//어떤 수가 합성수라면 반드시 그 수의 약수 중 하나는 제곱근 이하에 존재한다.
//→ 그래서 소수 판별은 제곱근까지만 검사하면 된다.
// 루트29는 5.3 몇 그러면 뒤에 때고 5까지만 검사하면 된다.
// 반면 36은 6 제곱근으로 딱 떨어짐 합성수임

func isPrime(_ num: Int) -> Bool {
    if num < 2 { return false }
    var i = 2
    while i * i <= num {
        if num % i == 0 {
            return false
        }
        i += 1
    }
    return true
}

func combinationSum(array arr: [Int], m count: Int)-> [Int] {
    var result: [Int] = []
    var temp: [Int] = []
    
    func dfs(_ idx: Int, _ depth: Int) {
        if depth == count {
            let sum = temp.reduce(0,+)
            result.append(sum)
            return
        }
        
        for i in idx..<arr.count {
            temp.append(arr[i])
            dfs(i+1, depth+1)
            temp.removeLast()
        }
    }
    dfs(0,0)
    return result
}

// 답은 한 배열만 반환 let
let allSums = combinationSum(array: inputArr, m: M)
// 중복방지
let primeSums = Set(allSums.filter { isPrime($0) }).sorted()

if primeSums.isEmpty {
    print(-1)
} else {
    print(primeSums.map { String($0) }.joined(separator: " "))
}
