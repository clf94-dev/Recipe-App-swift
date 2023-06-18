//
//  ContentView.swift
//  Recipe List App
//
//  Created by Carmen Lucas on 17/6/23.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
     
            NavigationView {
                List(model.recipes){r in
                    
                    NavigationLink(destination: RecipeDetailView(recipe: r), label:{
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
                        
                        
                    })
                    
                }.navigationBarTitle("All Recipes")
            }
        }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
