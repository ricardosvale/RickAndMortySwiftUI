//
//  CardCharacters.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 25/10/24.
//

import SwiftUI

struct CardCharacters: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.cardCharacters))
                .stroke(Color(.terciary), lineWidth: 2)
                .padding()
                .frame(maxWidth: 176, maxHeight: 240)
                .shadow(radius: 4, x:0 , y:2)
                
             VStack{
                    Rectangle()
                        .cornerRadius(10)
                        .foregroundColor(Color(.white))
                        .padding(.horizontal, 20)
                        .frame(width: 133, height: 133)
                        .padding(.top, 10)
               
                Text("Rick Sanchez")
                     .font(.jockeyOne(size: 24))
                
                Text("Human")
                 
                Text("Alive")
                }
            .foregroundColor(Color(.white))
            .padding()
    }
        
    }
}

#Preview {
    CardCharacters()
}
