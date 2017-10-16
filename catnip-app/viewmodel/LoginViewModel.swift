import UIKit

class LoginViewModel {
    var credential: LoginCredential?
    
    var loginMessage: String? {
        return credential.map(makeLoginMessage)
    }
    
    private func makeLoginMessage(cred: LoginCredential) -> String {
        return "Login: \(cred.username), \(cred.password)"
    }
}
