import Foundation

class LoginKeyTranslator {
    func translate(data: Data) -> LoginKey? {
        let dataJson = try? JSONSerialization.jsonObject(with: data, options: [])
        if let dict = dataJson as? [String: Any] {
            if let key = dict["key"] as? String {
                return LoginKey(key: key)
            }
        }
        return nil
    }
}
