//
//  CardNavigationHome.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 23/10/24.
//

import SwiftUI

struct CardNavigationHome: View {
  var title: String
  var description: String
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.linearTop, .linearBottom]), startPoint: .top, endPoint: .bottom)
                 )
            // Titulo
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.jockeyOne(size: 32))

                    Spacer()
                    Text(">")
                        .font(.jost(.bold, size: 36))
               }
                // Descrição
                Text(description)
                    .font(.jost(.regular, size: 16))

            }.padding(.top, 30)
                .padding(.horizontal, 20)
                .foregroundColor(.white)

        }.padding(.bottom, 10)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: 170)
     }
}

#Preview {
    CardNavigationHome(title: "Meu Título", description: "Minha descrição")
}
