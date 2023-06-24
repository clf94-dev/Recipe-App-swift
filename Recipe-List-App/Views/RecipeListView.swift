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
            VStack (alignment: .leading){
                Text("All recipes")
                    .bold()
                    .font(.largeTitle)
                    .padding(.top, 40)
                ScrollView{
                    LazyVStack (alignment: .leading) {
                        ForEach(0..<model.recipes.count, id: \.self) { index in
                            NavigationLink(destination: RecipeDetailView(recipe: model.recipes[index]), label:{
                                HStack(spacing:20){
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width:80, height:80, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack (alignment: .leading) {
                                        Text(model.recipes[index].name)
                                            .foregroundColor(.black)
                                            .bold()
                                        RecipeHighlights(highlights: model.recipes[index].highlights)
                                            .foregroundColor(.black)
                                            .font(.system(size: 14))
                                    }
                                }
                            })
                            
                        }
                    }
                }
                
                //List(model.recipes){r in
                
                
                
                //} // .navigationBarTitle("All Recipes")
                
            }
                .navigationBarBackButtonHidden(true)
                .padding(.leading)
            
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
