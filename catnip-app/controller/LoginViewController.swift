import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    private let viewModel = LoginViewModel()
    
    @IBAction func loginTouched(_ sender: Any) {
        let name = textFieldName.text!
        let password = textFieldPassword.text!
        
        viewModel.credential = LoginCredential(username: name, password: password)
        if let message = viewModel.loginMessage {
            print(message)
        }
    }
}
