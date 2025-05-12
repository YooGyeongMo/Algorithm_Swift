import Foundation

enum ActionType: String {
    case enter = "Enter"
    case leave = "Leave"
    case change = "Change"
}

struct Record {
    let action: ActionType
    let userID: String
    let nickname: String?

    init?(_ line: String) {
        let parts = line.split(separator: " ").map(String.init)
        guard let action = ActionType(rawValue: parts[0]) else { return nil }
        self.action = action
        self.userID = parts[1]
        self.nickname = parts.count == 3 ? parts[2] : nil
    }
}

func parseRecords(_ record: [String]) -> [Record] {
    return record.compactMap { Record($0) }
}

func updateNicknames(from records: [Record]) -> [String: String] {
    var map = [String: String]()
    for r in records where r.action != .leave {
        if let name = r.nickname {
            map[r.userID] = name
        }
    }
    return map
}

func generateLogs(from records: [Record]) -> [(ActionType, String)] {
    return records.compactMap {
        switch $0.action {
        case .enter, .leave:
            return ($0.action, $0.userID)
        default:
            return nil
        }
    }
}

func generateMessages(from logs: [(ActionType, String)], with nicknames: [String: String]) -> [String] {
    return logs.map { action, id in
        let name = nicknames[id] ?? ""
        return action == .enter
            ? "\(name)님이 들어왔습니다."
            : "\(name)님이 나갔습니다."
    }
}

func solution(_ record: [String]) -> [String] {
    let parsed = parseRecords(record)
    let nicknames = updateNicknames(from: parsed)
    let logs = generateLogs(from: parsed)
    return generateMessages(from: logs, with: nicknames)
}


