import UIKit

class MainScreenViewController: UIViewController {
    private let viewModel = MainScreenViewModel()
    
    override func viewDidAppear(_ animated: Bool) {
        if (viewModel.shouldLogin) {
            performLogin()
        }
        else {
            // TODO: fetch data and present
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LoginViewController {
            vc.loginSuccess = onLoginSuccess
        }
    }
    
    private func performLogin() {
        performSegue(withIdentifier: "loginSegue", sender: self)
    }
    
    private func onLoginSuccess(key: String) {
        print("Login Key: \(key)")
        viewModel.loginKey = key
    }
}
