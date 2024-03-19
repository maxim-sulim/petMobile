//
//  NetworkService.swift
//  SulimEffective
//
//  Created by Максим Сулим on 19.03.2024.
//

import Foundation

enum PathAPI: String {
    case vacancy = "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14"
}

protocol NetworkServiceProtocol: AnyObject {
    func get(path: PathAPI) async throws -> (Data, URLResponse)
}

final class NetworkService: NetworkServiceProtocol {
    func get(path: PathAPI) async throws -> (Data, URLResponse)  {
        guard let url = URL(string: path.rawValue) else {
            throw URLError(.badURL)
        }
        return try await URLSession.shared.data(from: url)
    }
}
