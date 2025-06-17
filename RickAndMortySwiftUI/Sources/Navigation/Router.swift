//
//  Router.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 16/06/25.
//

import SwiftUI

final class Router: ObservableObject {
    
    @Published var path = NavigationPath()
  
    func push(_ route: Route){
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func popToRoot(){
        path = NavigationPath()
    }
}
