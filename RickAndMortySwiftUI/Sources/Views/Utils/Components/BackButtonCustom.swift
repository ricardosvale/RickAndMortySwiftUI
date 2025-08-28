//
//  ToolBarCustom.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 28/08/25.
//

import SwiftUI

struct BackBarCustom: View {
    @EnvironmentObject var router: Router
    var title: String = "Voltar"
    var color: Color = .primary
    
    var body: some View {
      Button(action: {
                router.pop()
            }, label: {
                HStack {
                    Image(systemName: "chevron.left")
                    Text(title)
                }
                .foregroundColor(color)
            })
        }
    }
