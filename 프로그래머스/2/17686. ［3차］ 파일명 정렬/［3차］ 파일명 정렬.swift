func solution(_ files: [String]) -> [String] {
    
    var listFiles: [(og: String, head: String, number: Int, tail: String)] = []
    
    for file in files {
        var fileHead: String = ""
        var number: String = ""
        var idx: String.Index = file.startIndex
        
        // HEAD 추출
        while idx < file.endIndex, !file[idx].isNumber {
            fileHead.append(file[idx])
            idx = file.index(after: idx)
        }
        
        // NUMBER 추출 (최대 5자리)
        for _ in 0..<5 {
            guard idx < file.endIndex else { break }
            let char = file[idx]
            if char == "." || !char.isNumber { break }
            number.append(char)
            idx = file.index(after: idx)
        }
        
        // TAIL = 남은 부분
        let tail = String(file[idx...])
        
        // 예외 없이 안전하게 언래핑
        let numberInt = Int(number) ?? 0
        
        listFiles.append((og: file, head: fileHead, number: numberInt, tail: tail))
    }
    
    // 정렬
    let sorted = listFiles.sorted {
        let h1 = $0.head.lowercased()
        let h2 = $1.head.lowercased()
        
        if h1 != h2 {
            return h1 < h2
        } else {
            return $0.number < $1.number
        }
    }
    
    return sorted.map { $0.og }
}