import Foundation
import Moya
import RxMoya
import RxSwift

class AuthRepository {
    // TODO: 여기서 Error 처리
    let provider = MoyaProvider<AuthAPI>(plugins: [MoyaLoggingPlugin()])
    let disposeBag = DisposeBag()

    func postLogin(id: String, password: String) -> Completable {
        let observable = Completable.create { [weak self] completable in
            guard let self = self else { return Disposables.create {} }
            provider.rx.request(.login(id: id, password: password))
                .map(TokenDTO.self)
                .subscribe(
                    onSuccess: {
                        TokenStorage.shared.accessToken = $0.accessToken
                        TokenStorage.shared.refreshToken = $0.refreshToken
                        completable(.completed)
                    },
                    onFailure: {
                        completable(.error(self.errorToLocalization($0)))
                    }
                )
                .disposed(by: disposeBag)
            return Disposables.create {}
        }
        return observable
    }

    private func errorToLocalization(_ error: Error) ->AuthError {
        guard let statusCode = (error as? MoyaError)?.response?.statusCode else {
            return .UNOWNEDERROR
        }
        return AuthError(rawValue: statusCode) ?? .UNOWNEDERROR
    }
}
