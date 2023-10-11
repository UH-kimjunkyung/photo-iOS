import Foundation

enum UrlManager {
    case baseURL
}

extension UrlManager {
    // TODO: BaseURL 삽입
    var url: URL {
        switch self {
        case .baseURL:
            return URL(string: "")!
        }
    }
}
