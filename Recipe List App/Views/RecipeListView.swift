//
//  ContentView.swift
//  Recipe List App
//
//  Created by Carmen Lucas on 17/6/23.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeModel()
    var body: some View {
        List(model.recipes){r in
            HStack(spacing:20){
                Image(r.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width:80, height:80, alignment: .center)
                    .clipped()
                    .cornerRadius(5
                    )
                Text(r.name)
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
