//
//  NetworkManager.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation

protocol NetworkManagerProtocol: AnyObject {
    func getDataSearch() async throws -> Hanter
}

final class NetworkManager {
    let networkService: NetworkServiceProtocol
    
    init() {
        self.networkService = NetworkService()
    }
}

extension NetworkManager: NetworkManagerProtocol {
    func getDataSearch() async throws -> Hanter {
        let (data, response) = try await networkService.get(path: .vacancy)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(Hanter.self, from: data)
        } catch {
            throw URLError(.dataNotAllowed)
        }
    }
}
