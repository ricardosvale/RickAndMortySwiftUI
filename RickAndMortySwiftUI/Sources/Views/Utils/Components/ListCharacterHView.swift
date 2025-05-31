//
//  ListCharacterHView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 31/05/25.
//

import SwiftUI

struct ListCharacterHView: View {
    let label: String
    let image: [String]
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(label)
                .font(.jockeyOne(size: 32))
            ScrollView {
           LazyHGrid(rows: Array(repeating: GridItem(.flexible(minimum: 20)), count: 12), spacing: 20) {
             
                   ForEach(image, id: \.self){ image in
                       AsyncImage(url: URL(string: image)) { phase in
                           switch phase {
                           case .empty:
                               ProgressView("Carregando imagem...")
                                   .padding(.horizontal, 45)
                               
                           case .success(let image):
                               image
                                   .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .clipShape(RoundedRectangle(cornerRadius: 15))
                                   .padding(.horizontal, 45)
                           case .failure:
                               Image("Noimage")
                                   .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .clipShape(RoundedRectangle(cornerRadius: 15))
                                   .padding(.horizontal, 45)
                               
                           @unknown default:
                               fatalError()
                           }
                           
                       }
                   }
               }
            }
                
        }
    }
}

#Preview {
    ListCharacterHView(label: "Residente", image: Location.locationMock().residents)
}
