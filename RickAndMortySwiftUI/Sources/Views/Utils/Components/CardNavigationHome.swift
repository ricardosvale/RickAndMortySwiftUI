//
//  CardNavigationHome.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 23/10/24.
//

import SwiftUI

struct CardNavigationHome: View {
    var body: some View {
        ZStack (alignment: .top){
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.linearTop, .linearBottom]), startPoint: .top, endPoint: .bottom)
                 )
            //Titulo
            VStack(alignment: .leading) {
                HStack {
                    Text("Personagem")
                        .font(.jockeyOne(size: 32))
                    
                    Spacer()
                    Text(">")
                        .font(.jost(.bold, size:36))
               }
                //Descrição
                Text("Detalhes sobre os personagem")
                    .font(.jost(.regular, size: 16))
                
            }.padding(.top, 30)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
            
        }.padding(.bottom, 30)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: 170)
     }
}

#Preview {
    CardNavigationHome()
}
