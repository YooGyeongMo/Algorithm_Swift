//
//  부모의 트리.swift
//  알고리즘 연습
//
//  Created by Demian Yoo on 4/16/25.
//

/* TODO
1. 트리 구조 파악 -> 트리 루트 1, 양방향임
2. dfs 사용하면 될듯함 dfs(1)로 들어가서 깊이들어가서 빠져나오면서 그 위에 노드를 체크하고 뱉어주면됨.
3. 함수로 분할해보기
 
 */
import Foundation

let N = Int(readLine()!)!

var tree: [[Int]] = Array( repeating:[Int](), count: N+1 )
var parentArr: [Int] = Array( repeating:0, count: N+1 )
var visited = Array( repeating: false, count: N+1 )


// MARK - 함수 익스텐션 만들어보기
extension Array {
    func makeMap<T>(_ transform: (Element) -> T?) -> [T] {
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

// MARK - 트리 만들기
func makeTree(_ loop: Int) {
    // loop-1번
    for _ in 0..<loop {
        // NOTE - 튜플로 들어감
        if let (a, b) = readLine()!.split(separator: " ").makeMap({ Int($0) }).asTuple() {
            tree[a].append(b)
            tree[b].append(a)
        }
    }
}

// MARK - dfs 부모찾기
func findParentNode(_ idx: Int) {
    visited[idx] = true
    
    for nextIdx in tree[idx] {
        if !visited[nextIdx] {
            parentArr[nextIdx] = idx
            findParentNode(nextIdx)
        }
    }
}

// MARK - 트리 출력하기
func printAnswer() {
    // 1번 노드 루트라서 표현 X
    for i in 2...N {
        print(parentArr[i])
    }
}

makeTree(N-1)
findParentNode(1)
printAnswer()
