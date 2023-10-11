import Foundation
import Moya
import RxMoya
import RxSwift

class LoginUseCase {

    let authRepository: AuthRepository = AuthRepository()

    func excute(id: String, password: String) -> Completable {
        return authRepository.postLogin(id: id, password: password)
    }
}
