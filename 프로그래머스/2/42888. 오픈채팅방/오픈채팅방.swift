import Foundation

//userManager - 싱글톤
final class UserManager {
    static let shared = UserManager()
    private var nicknames: [String: String] = [:]
    
    private init() {}
    
    func updateNickname(_ userID: String, _ nickname: String) {
        nicknames[userID] = nickname
    }
    
    func getNickname(_ userID: String) -> String {
        return nicknames[userID] ?? ""
    }
}

// MARK: - action Enum
enum ActionType: String {
    case enter = "Enter"
    case leave = "Leave"
    case change = "Change"
}

// MARK: - Record Struct (입력 1줄 파싱용)

struct Record {
    let action: ActionType
    let userID: String
    let nickname: String?

    init?(_ line: String) {
        let parts = line.split(separator: " ").map { String($0) }
        guard let action = ActionType(rawValue: parts[0]) else { return nil }
        self.action = action
        self.userID = parts[1]
        self.nickname = parts.count > 2 ? parts[2] : nil
    }
}

// MARK: - Solution

func solution(_ record: [String]) -> [String] {
    var parsedRecords: [Record] = []
    var messageLogs: [(userID: String, action: ActionType)] = []

    // 1차 순회: 닉네임 저장
    for line in record {
        guard let r = Record(line) else { continue }
        parsedRecords.append(r)

        if r.action == .enter || r.action == .change, let nickname = r.nickname {
            UserManager.shared.updateNickname(r.userID, nickname)
        }

        if r.action == .enter || r.action == .leave {
            messageLogs.append((userID: r.userID, action: r.action))
        }
    }

    // 2차 순회: 메시지 출력
    return messageLogs.map { entry in
        let nickname = UserManager.shared.getNickname(entry.userID)
        switch entry.action {
        case .enter:
            return "\(nickname)님이 들어왔습니다."
        case .leave:
            return "\(nickname)님이 나갔습니다."
        default:
            return ""
        }
    }
}