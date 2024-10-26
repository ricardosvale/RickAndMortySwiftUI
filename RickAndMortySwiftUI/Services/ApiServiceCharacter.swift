//
//  ApiService.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 26/10/24.
//
import Foundation
import Combine

class ApiService {
    
    static let shared = ApiService()
    private let baseUrl: String = "https://rickandmortyapi.com/api/character"
    
    func getCharacters() -> Void {
       // transformando a string em uma URL
        let url = URL(string: baseUrl)
        
    }
    
}
