import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    private let viewModel = LoginViewModel()
    private let loginService = LoginService()
    
    var loginSuccess: ((String) -> ())?
    
    @IBAction func loginTouched(_ sender: Any) {
        let name = textFieldName.text!
        let password = textFieldPassword.text!
        let credential = LoginCredential(username: name, password: password)
        
        viewModel.credential = credential
        
        loginService.login(credential: credential,
                           success: { [weak self] key in self?.onLoginSuccess(key: key) },
                           failure: { [weak self] error in self?.onLoginFailure(error: error) })
    }
    
    private func onLoginSuccess(key: String) {
        loginSuccess?(key)
        dismiss(animated: true, completion: nil)
    }
    
    private func onLoginFailure(error: APIError) {
        // TODO: Show error message etc
    }
}
