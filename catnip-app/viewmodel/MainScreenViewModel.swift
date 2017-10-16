import UIKit

class MainScreenViewModel: NSObject {
    var loginKey: String?
    
    var shouldLogin: Bool {
        return loginKey == nil
    }
}
