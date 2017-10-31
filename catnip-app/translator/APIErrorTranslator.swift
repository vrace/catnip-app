import Foundation

class APIErrorTranslator {
    var defaultError: APIError {
        return APIError(code: 999, message: "Unknown error")
    }
    
    func translate(data: Data?, response: URLResponse?, error: Error?) -> APIError {
        let code = response.flatMap(translateResponseCode) ?? 999
        
        if let errorMessage = data.flatMap(translateErrorMessage) {
            return APIError(code: code, message: errorMessage)
        }
        
        if let err = error?.localizedDescription {
            return APIError(code: code, message: err)
        }
        
        return APIError(code: code, message: "Unknown error occurred")
    }
    
    private func translateErrorMessage(data: Data) -> String? {
        if data.count > 0 {
            let dataJson = try? JSONSerialization.jsonObject(with: data, options: [])
            if let dict = dataJson as? [String: Any] {
                return dict["message"] as? String
            }
        }
        
        return nil
    }
    
    private func translateResponseCode(response: URLResponse) -> Int? {
        if let res = response as? HTTPURLResponse {
            return res.statusCode
        }
        
        return nil
    }
}
