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
    
}

extension NetworkManager: NetworkManagerProtocol {
    func getDataSearch() async throws -> Hanter {
        let urlApi = "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14"
        guard let url = URL(string: urlApi) else {
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
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
