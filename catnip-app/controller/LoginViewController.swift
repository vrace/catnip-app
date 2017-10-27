import UIKit

class LoginViewController: UIViewController, URLSessionDelegate {
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var labelLoginError: UILabel!
    
    private let viewModel = LoginViewModel()
    private let loginService = LoginService()
    
    var loginSuccess: ((String) -> ())?
    
    override func viewDidLoad() {
        labelLoginError.text = ""
        super.viewDidLoad()
    }
    
    @IBAction func loginTouched(_ sender: Any) {
        let name = textFieldName.text!
        let password = textFieldPassword.text!
        let credential = LoginCredential(username: name, password: password)
        
        loginService.login(credential: credential,
                           success: { [weak self] key in self?.onLoginSuccess(key: key) },
                           failure: { [weak self] error in self?.onLoginFailure(error: error) })
    }
    
    private func onLoginSuccess(key: String) {
        loginSuccess?(key)
        dismiss(animated: true, completion: nil)
    }
    
    private func onLoginFailure(error: APIError) {
        viewModel.loginError = error
        DispatchQueue.main.async {
            self.labelLoginError.text = self.viewModel.loginErrorMessage
        }
    }
}
