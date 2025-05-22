//
//  LocationServiceProtocol.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 30/04/25.
//

import Foundation

protocol LocationServiceProtocol {
    func fetchLocationAwait(page: Int) async throws -> LocationResponse
}
