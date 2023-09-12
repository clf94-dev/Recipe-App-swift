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
    
    @State private var filterBy = ""
    
    private var filteredRecipes: [Recipe] {
        if filterBy.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return Array(recipes)
        } else {
            // filter by the search string
            return recipes.filter { r in
                r.name.contains(filterBy)
            }
        }
    }
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading){
                Text("All recipes")
                    .bold()
                    .font(Font.custom("Avenir Heavy", size: 32))
                    .padding(.top, 40)
                SearchBarView(filterBy: $filterBy)
                    .padding([.trailing,.bottom])
                ScrollView{
                    LazyVStack (alignment: .leading) {
                        ForEach(filteredRecipes) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe), label:{
                                HStack(spacing:20){
                                    let image = UIImage(data: recipe.image ?? Data()) ?? UIImage()

                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width:80, height:80, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack (alignment: .leading) {
                                        Text(recipe.name)
                                            .foregroundColor(.black)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                        RecipeHighlights(highlights: recipe.highlights)
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
                .onTapGesture {
                    // resign first responder
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
