//
//  UserDefault.swift
//  SulimEffective
//
//  Created by Максим Сулим on 16.03.2024.
//

import Foundation

enum ObjectSavebleError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object"
    case unableToDecode = "Unable to decode"
    
    var errorDescription: String? {
        self.rawValue
    }
}

protocol ObjectSaveble {
    func setObject<Object: Codable>(_ object: Object, forKey: String) throws
    func getObject<Object: Codable>(forKey: String, castTo type: Object.Type) throws -> Object
}

extension UserDefaults: ObjectSaveble {
    func setObject<Object: Codable>(_ object: Object, forKey: String) throws  {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: forKey)
        } catch {
            throw ObjectSavebleError.unableToEncode
        }
    }
    
    func getObject<Object: Codable>(forKey: String, castTo type: Object.Type) throws -> Object {
        guard let data = data(forKey: forKey) else { throw ObjectSavebleError.noValue }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw ObjectSavebleError.unableToDecode
        }
    }
}
