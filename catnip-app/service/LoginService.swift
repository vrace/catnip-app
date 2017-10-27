import UIKit

class LoginService {
    private let urlSessionConfiguration = URLSessionConfiguration.default
    private let urlLogin = NSURL(string: "http://localhost:8080/login/")
    private let apiErrorTranslator = APIErrorTranslator()
    
    func login(credential: LoginCredential, success: ((String) -> ())?, failure: ((APIError) -> ())?) {
        if let url = urlLogin?.absoluteURL {
            let session = URLSession(configuration: urlSessionConfiguration)
            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                if let err = self.apiErrorTranslator.translate(response: response, error: error) {
                    failure?(err)
                }
                else {
                    
                }
            })
            task.resume()
        }
    }
}
