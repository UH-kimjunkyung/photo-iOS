import Foundation
import SwiftKeychainWrapper

enum TokenType {
    case accessToken, refreshToken, tokenIsEmpty

    var chainKey: String {
        switch self {
        case .accessToken:
            return "ACCESS-TOKEN"
        case .refreshToken:
            return "REFRESH-TOKEN"
        case .tokenIsEmpty:
            return ""
        }
    }
}

final class TokenStorage {
    public static let shared = TokenStorage()
    private init() {}

    var accessToken: String? {
        set {
            KeychainWrapper.standard.set(newValue ?? "", forKey: TokenType.accessToken.chainKey)
        }
        get {
            return KeychainWrapper.standard.string(forKey: TokenType.accessToken.chainKey)
        }
    }

    var refreshToken: String? {
        set {
            KeychainWrapper.standard.set(newValue ?? "", forKey: TokenType.refreshToken.chainKey)
        }
        get {
            return KeychainWrapper.standard.string(forKey: TokenType.refreshToken.chainKey)
        }
    }

    func header(_ tokenType: TokenType) -> [String: String] {
        guard let accessToken = accessToken else {
            return ["Content-Type": "application/json"]
        }
        guard let refreshToken = refreshToken else {
            return ["Content-Type": "application/json"]
        }

        switch tokenType {
        case .accessToken:
            return [
                "Content-Type": "application/json",
                "Authorization": accessToken
            ]
        case .refreshToken:
            return [
                "Content-Type": "application/json",
                "Authorization": refreshToken
            ]
        case .tokenIsEmpty:
            return  ["Content-Type": "application/json"]
        }
    }
}
