import Foundation

enum AuthError: Int, Error {
    case SERVERERROR = 500
    case UNOWNEDERROR = 0
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .SERVERERROR:
            return "서버 오류"
        case .UNOWNEDERROR:
            return "알 수 없는 오류입니다."
        }
    }
}
