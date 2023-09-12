//
//  ContentView.swift
//  Recipe List App
//
//  Created by Carmen Lucas on 17/6/23.
//

import SwiftUI

struct RecipeListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    // @EnvironmentObject var model:RecipeModel
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var recipes: FetchedResults<Recipe>
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading){
                Text("All recipes")
                    .bold()
                    .font(Font.custom("Avenir Heavy", size: 32))
                    .padding(.top, 40)
                    
                ScrollView{
                    LazyVStack (alignment: .leading) {
                        ForEach(0..<recipes.count, id: \.self) { index in
                            NavigationLink(destination: RecipeDetailView(recipe: recipes[index]), label:{
                                HStack(spacing:20){
                                    let image = UIImage(data: recipes[index].image ?? Data()) ?? UIImage()

                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width:80, height:80, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack (alignment: .leading) {
                                        Text(recipes[index].name)
                                            .foregroundColor(.black)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                        RecipeHighlights(highlights: recipes[index].highlights)
                                            .foregroundColor(.black)
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
