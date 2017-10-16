import UIKit

class LoginService {
    private let loginCredentialTranslator = LoginCredentialTranslator()
    
    func login(credential: LoginCredential, success: ((String) -> ())?, failure: ((APIError) -> ())?) {
        let cred = loginCredentialTranslator.translate(credential: credential)
        // faking API call and call success directly
        success?(cred)
    }
}
