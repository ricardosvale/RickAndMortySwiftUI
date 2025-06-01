//
//  ListCharacterHView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 31/05/25.
//

import SwiftUI

struct ListCharacterHView: View {
    let title: String
    let images: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(title)
                .font(.jockeyOne(size: 32))
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(images, id: \.self) { image in
                      
                        characterImage(url: image)
                    }
                }
                
            }
            .frame(height: 80)
        }
        .padding(.horizontal, 22)
    }
    
    @ViewBuilder
    func characterImage(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 80, height: 80)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            case .failure:
                Image("Noimage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
            @unknown default:
                EmptyView()
            }
        }
    }
  
    

}

#Preview {
    ListCharacterHView(title: "Residente", images: Location.locationMock().residents)
}
