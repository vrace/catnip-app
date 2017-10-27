import Foundation

class APIErrorTranslator {
    func translate(response: URLResponse?, error: Error?) -> APIError? {
        if let err = error {
            let code = response.flatMap(extractStatusCode) ?? 503
            return APIError(code: code, message: err.localizedDescription)
        }
        
        return nil
    }
    
    private func extractStatusCode(response: URLResponse) -> Int? {
        if let httpResponse = response as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        
        return nil
    }
}
