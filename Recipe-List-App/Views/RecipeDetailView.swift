//
//  DetailView.swift
//  Recipe List App
//
//  Created by Carmen Lucas on 17/6/23.
//


import SwiftUI

struct RecipeDetailView: View {
    @State var selectedIndex = 2
    var recipe: Recipe
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                //  MARK: Recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                Text(recipe.name)
                Text("Choose your serving size")
                Picker("Servings", selection: $selectedIndex){
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }.pickerStyle(SegmentedPickerStyle())
                Text("Selected servings: \(selectedIndex)")
                Divider()
                // MARK: Recipe ingredients
                VStack(alignment: .leading){
                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.bottom,10)
                    ForEach(recipe.ingredients){ ingredient in
                        Text("• " + ingredient.name)
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
