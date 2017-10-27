import UIKit

class LoginViewModel {
    var loginError: APIError?
    
    var loginErrorMessage: String? {
        return loginError?.message
    }
}
