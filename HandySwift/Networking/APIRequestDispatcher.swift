//
//  APIRequestDispatcher.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 07.02.23.
//

import Foundation

class APIRequestDispatcher {
    
    class func request<T: Codable>(apiRouter: APIRouter) async throws -> T {
        var components = URLComponents()
        components.host = apiRouter.host
        components.scheme = apiRouter.scheme
        components.path = apiRouter.path
        components.queryItems = apiRouter.parameters
        
        guard let url = components.url else { throw APIRequestError.badUrl }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = apiRouter.method
        //A nuance of food hiegene api, not needed in other cases
        urlRequest.addValue("2", forHTTPHeaderField: "x-api-version")
        
        let session = URLSession(configuration: .default)

        return try await withCheckedThrowingContinuation { continuation in // 4
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    return continuation.resume(with: .failure(error))
                }
                
                guard let data = data else {
                    return continuation.resume(with: .failure(APIRequestError.noData)) // 5
                }
                
                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async { // 6
                        return continuation.resume(with: .success(responseObject)) // 7
                    }
                } catch {
                    return continuation.resume(with: .failure(error))
                }
            }
            dataTask.resume()
        }
    }
}


