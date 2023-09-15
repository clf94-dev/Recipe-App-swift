//
//  RecipeTabView.swift
//  Recipe-App
//
//  Created by Carmen Lucas on 18/6/23.
//

import SwiftUI

struct RecipeTabView: View {
    @State var tabIndex = 2
    var body: some View {
        
            TabView(selection: $tabIndex)
            {
                // MARK: featured tab
                RecipeFeaturedView()
                .tabItem{
                    VStack{
                        Image(systemName:"star")
                        Text("Featured")
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .tag(Constants.featuredView)
                // MARK: List tab
                RecipeListView()
                .tabItem{
                    VStack{
                        Image(systemName:"pencil")
                        Text("List")
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .tag(Constants.listView)
                // MARK: List tab
                AddRecipeView(selectedTab: $tabIndex)
                .tabItem{
                    VStack{
                        Image(systemName:"plus")
                        Text("Add")
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .tag(Constants.addRecipeView)
            }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
