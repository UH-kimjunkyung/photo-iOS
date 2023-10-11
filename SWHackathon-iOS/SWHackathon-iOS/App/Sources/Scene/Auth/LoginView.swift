import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()

    var body: some View {
        TextField("hello", text: $loginViewModel.password)
    }
}

#Preview {
    LoginView()
}
