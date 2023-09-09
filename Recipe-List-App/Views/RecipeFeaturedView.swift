//
//  RecipeFeaturedView.swift
//  Recipe-List-App
//
//  Created by Carmen Lucas on 18/6/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0){
            Text("Featured Recipes")
                .bold()
                .font(Font.custom("Avenir Heavy", size: 32))
                .padding(.leading)
                .padding(.top, 40)
            
            GeometryReader {geo in
                TabView(selection: $tabSelectionIndex){
               
                    ForEach(0..<model.recipes.count) { index in
                        if model.recipes[index].featured == true {
                            
                            Button(action: {
                                // show detail on tab
                                self.isDetailViewShowing = true
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack (spacing: 0){
                                        let image = UIImage(data: model.recipes[index].image ?? Data()) ?? UIImage()
                                        Image(uiImage: image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                        
                                    }
                                }
                            }).tag(index)
                            
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y:5)
                        }
                        // .shadow(radius: 10)
                        
                    }
                    
                    }.sheet(isPresented: $isDetailViewShowing){
                        //Show recipe detail view
                        RecipeDetailView(recipe: model.recipes[tabSelectionIndex])
                        
                        
                    }
                   
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            VStack (alignment: .leading, spacing: 10) {
                Text("Preparation Time")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }.padding(.leading)
                .padding(.bottom,10)
            }
        .onAppear(perform: {
            findFirstFeaturedItemIndex()
        })
           
        
        
        
    }
    
    func findFirstFeaturedItemIndex(){
        let index = model.recipes.firstIndex { recipe in
            
            return recipe.featured
        }
    tabSelectionIndex = index ?? 0
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
