import Foundation
import Moya

enum AuthAPI {
    case login(id: String, password: String)
    case signup(id: String, password: String)
}

extension AuthAPI: TargetType {
    var baseURL: URL {
        UrlManager.baseURL.url
    }
    
    var path: String {
        switch self {
        case .login:
            return ""
        case .signup:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .signup:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .login(let id, let password):
            return .requestPlain
        case .signup(let id, let password):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return TokenStorage.shared.header(.tokenIsEmpty)
    }
}
