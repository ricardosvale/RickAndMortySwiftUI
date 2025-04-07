//
//  Episodes.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 07/04/25.
//

import SwiftUI

struct Episodes: View {
   
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("Pilot")
                    .font(.jockeyOne(size: 24))
                Text("December 20, 2013")
                    .font(.kodeMono(.regular, size: 14))
                    
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 15)
            Spacer()
            Text("S01E01")
                .font(.kodeMono(.regular, size: 14))
                .padding(.vertical, -15)
                .padding(.horizontal, 8)
        }
        .foregroundStyle(.white)
        .background(.episodes)
        .cornerRadius(5)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 23)
    }
       
    
}

#Preview {
    Episodes()
}

