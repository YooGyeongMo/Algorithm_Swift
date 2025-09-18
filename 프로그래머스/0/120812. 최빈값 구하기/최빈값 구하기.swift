import Foundation

func solution(_ array: [Int]) -> Int {
    
    if array.count == 1 { return array[0] }
    
    var dic: [Int: Int] = [:]
    
    // 빈도수 세기
    for num in array {
        dic[num, default: 0 ] += 1
    }
    
    // dic 딕셔너리 value의 최대값 담기
    guard let maxCount = dic.values.max() else { return -1 }
    
    // 담을 배열 초기화
    var result: [Int] = []
    
    // 최빈값 찾기
    for (key, value) in dic {
        if value == maxCount {
            result.append(key)
        }
    }
    
    return result.count > 1 ? -1 : result[0]
}