//
//  DetailView.swift
//  Recipe List App
//
//  Created by Carmen Lucas on 17/6/23.
//


import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                //  MARK: Recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                // MARK: Recipe ingredients
                VStack(alignment: .leading){
                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.bottom,10)
                    ForEach(recipe.ingredients, id: \.self){ ingredient in
                        Text("• " + ingredient)
                            .padding(.bottom, 3)
                    }
                }.padding(.all)
                // MARK: Divider
                Divider()
                // MARK: Recipe ingredients
                VStack(alignment: .leading){
                    Text("Directions:")
                        .font(.headline)
                        .padding(.vertical,10)
                    ForEach(0..<recipe.directions.count, id: \.self){ index in
                        Text( String(index) + " " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }.padding(.all)
            }

            
        }.navigationBarTitle(recipe.name)

        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
