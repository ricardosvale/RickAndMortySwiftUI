//
//  RickAndMortySwiftUIApp.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 22/10/24.
//

import SwiftUI

@main
struct RickAndMortySwiftUIApp: App {
    @StateObject var router = Router()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                HomeView()
                    .environmentObject(router)
            }
        }
    }
}
