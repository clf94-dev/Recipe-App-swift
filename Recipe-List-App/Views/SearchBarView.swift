//
//  SearchBarView.swift
//  Recipe-List-App
//
//  Created by Carmen Lucas on 12/9/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var filterBy: String
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 10)
                .foregroundStyle(.white)
                .shadow(radius: 4)
                .frame(height: 50)
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Filter by ...", text: $filterBy)
                Button {
                    // clear filter
                    filterBy = ""
                } label: {
                     Image(systemName: "multiply.circle.fill")
                        .foregroundStyle(.gray)
                }
            }.padding()
        }
        
    }
}


