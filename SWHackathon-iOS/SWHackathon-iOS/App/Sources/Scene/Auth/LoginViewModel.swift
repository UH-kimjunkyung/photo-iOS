import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var identifire: String = ""
    @Published var password: String = ""

    // TODO: UseCase 연결 (DI는 고민중)
    let loginUseCase = ""

    
}
