import Foundation

// 가장 아래가 1 가장 위가 8 행은 -가 위로가는것.
let direction: [String: (Int, Int)] = [
    "R": (1,0),
    "L": (-1,0),
    "B": (0,-1),
    "T": (0,1),
    "RT": (1,1),
    "LT": (-1,1),
    "RB": (1,-1),
    "LB": (-1,-1)
]

// .first/.last는 항상 Optional(Element?) 타입 , .asciiValue, unicodeScalar는 값이 없을수도 있어서 Optional로 반환
func transformToNum(_ chess: String) -> (Int, Int) {
    let colValue = Int(chess.first!.asciiValue! - Character("A").asciiValue!)
    let rowValue = Int(String(chess.last!))! - 1// Int()는 String, Double, Float, NSNumber등은 됨 Char는 X
    return (colValue, rowValue)
}

func transformToChess(_ target: (Int,Int)) -> String {
    let colChar = String(UnicodeScalar(target.0 + Int(Character("A").asciiValue!))!)
    let rowChar = String(target.1 + 1)
    
    return colChar + rowChar
}

let targetInfo = readLine()!.split(separator: " ").map{ String($0) }
var kingInfo =  transformToNum(targetInfo[0])
var stoneInfo = transformToNum(targetInfo[1])
let testCase = Int(targetInfo[2])!

func solution() {
    for _ in 0..<testCase {
        let moveInfo = readLine()!
        guard let move = direction[moveInfo] else  { continue }
        
        let nKing = (kingInfo.0 + move.0 , kingInfo.1 + move.1)
        
        // 체스판 벗어나면 무시 0 Based Indexing
        if nKing.0 < 0 || nKing.0 >= 8 || nKing.1 < 0 || nKing.1 >= 8 {
            continue
        }
        
        //킹이 이동할 자리에 돌이 있으면ㅠ
        if nKing == stoneInfo {
            let nStone = (stoneInfo.0 + move.0, stoneInfo.1 + move.1)
            
            if nStone.0 < 0 || nStone.0 >= 8 || nStone.1 < 0 || nStone.1 >= 8 {
                continue
            }
            
            //돌 이동 가능하면 ㄱㄱ
            kingInfo = nKing
            stoneInfo = nStone
        } else {
            //그냥 킹만
            kingInfo = nKing
        }
    }
    
    print(transformToChess(kingInfo))
    print(transformToChess(stoneInfo))
}

solution()
