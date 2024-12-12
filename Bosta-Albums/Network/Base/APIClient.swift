//
//  APIClient.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation
import Moya

protocol APIClient {
    associatedtype Router: BaseEndpoint
    func fetchData<T: Codable>(
        target: Router,
        completion: @escaping (Result<T, Error>) -> Void
    )
}

extension APIClient {

    func fetchData<T: Codable>(
        target: Router,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        let provider = MoyaProvider<Router>()

        provider.request(target, callbackQueue: .main) { result in
            
            switch result {
            case .success(let response):
                do {
                    guard response.statusCode == 200 else {
                        completion(.failure(NetworkError.invalidStatusCode(response.statusCode)))
                        return
                    }
                    
                    let decodedData = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(NetworkError.decodingFailed(error)))
                }

            case .failure(let error):
                completion(.failure(NetworkError.requestFailed(error)))
            }
        }
    }
}


