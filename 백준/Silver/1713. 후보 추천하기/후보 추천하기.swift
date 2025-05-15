let n = Int(readLine()!)!
let m = Int(readLine()!)!
let recommand = readLine()!.split(separator:" ").map { Int(String($0))! }

func finalPhotoFrames(frameCount n: Int, recommendationList nums: [Int]) -> [Int] {
    var stack: [Int] = []
    var count = Array(repeating: 0, count: 101)
    
    for student in nums {
        if stack.contains(student) {
            count[student] += 1
            continue
        }

        if stack.count == n {
            // 추천 수가 가장 적은 사람 찾기
            let minVote = stack.map { count[$0] }.min()!
            
            // 가장 먼저 걸린 학생 중 추천 수 == min 인 사람 제거
            for old in stack {
                if count[old] == minVote {
                    count[old] = 0
                    if let idx = stack.firstIndex(of: old) {
                        stack.remove(at: idx)
                    }
                    break
                }
            }
        }

        // 스택처럼 뒤에 추가
        stack.append(student)
        count[student] = 1
    }

    return stack.sorted()
}

let result = finalPhotoFrames(frameCount: n, recommendationList: recommand)
print(result.map { String($0) }.joined(separator: " "))