import Foundation

struct MaxHeap {
    private var heap: [Int] = []

    var isEmpty: Bool {
        return heap.isEmpty
    }

    mutating func insert(_ value: Int) {
        heap.append(value)
        var index = heap.count - 1

        while index > 0 {
            let parent = (index - 1) / 2
            if heap[index] <= heap[parent] { break }
            heap.swapAt(index, parent)
            index = parent
        }
    }

    mutating func removeMax() -> Int {
        guard !heap.isEmpty else { return 0 }

        heap.swapAt(0, heap.count - 1)
        let maxValue = heap.removeLast()
        var index = 0

        while index * 2 + 1 < heap.count {
            let left = index * 2 + 1
            let right = index * 2 + 2
            var bigger = left

            if right < heap.count && heap[right] > heap[left] {
                bigger = right
            }

            if heap[index] >= heap[bigger] { break }
            heap.swapAt(index, bigger)
            index = bigger
        }

        return maxValue
    }
}
let n = Int(readLine() ?? "") ?? 0
var heap = MaxHeap()

for _ in 0..<n {
    let x = Int(readLine() ?? "") ?? 0

    if x == 0 {
        print(heap.removeMax())
    } else {
        heap.insert(x)
    }
}