import UIKit

class LoginService {
    private let urlSessionConfiguration = URLSessionConfiguration.default
    private let urlLogin = NSURL(string: "http://localhost:8080/catnip/login/")!
    private let loginKeyTranslator = LoginKeyTranslator()
    private let apiErrorTranslator = APIErrorTranslator()
    private let loginCredentialTranslator = LoginCredentialTranslator()
    
    func login(credential: LoginCredential, success: ((LoginKey) -> Void)?, failure: ((APIError) -> Void)?) {
        invokeLogin(credential: credential) { (data, response, error) in
            if let key = data.flatMap(self.loginKeyTranslator.translate) {
                success?(key)
            }
            else {
                let err = self.apiErrorTranslator.translate(data: data, response: response, error: error)
                failure?(err)
            }
        }
    }
    
    private func invokeLogin(credential: LoginCredential, handler: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        var request = URLRequest(url: urlLogin.absoluteURL!)
        request.httpMethod = "POST"
        request.httpBody = loginCredentialTranslator.translate(credential: credential)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession(configuration: urlSessionConfiguration)
        let task = session.dataTask(with: request, completionHandler: handler)
        task.resume()
    }
}
