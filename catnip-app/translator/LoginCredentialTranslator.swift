import Foundation

class LoginCredentialTranslator {
    func translate(credential: LoginCredential) -> String {
        return "\(credential.username):\(credential.password)"
    }
}
