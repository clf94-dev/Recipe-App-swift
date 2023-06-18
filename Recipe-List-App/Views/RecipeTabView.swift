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
                    }
                }
                .tag(1)
                // MARK: List tab
                RecipeListView()
                .tabItem{
                    VStack{
                        Image(systemName:"pencil")
                        Text("List")
                    }
                }
                .tag(2)
                
            }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
