//
//  ApiError.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 29/04/25.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidStatusCode(Int)
    case decodingFailed
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL Inválida."
        case .invalidStatusCode(let code):
            return "Erro HTTP, código:\(code)."
        case .decodingFailed:
            return "Decodificação falhou."
        case .networkError(let error):
            return "Erro na rede: \(error.localizedDescription)."
        }
    }
}
