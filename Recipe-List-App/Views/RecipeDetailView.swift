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
            VStack(alignment: .leading, spacing: 0) {
                //  MARK: Recipe image
                let image = UIImage(data: recipe.image ?? Data()) ?? UIImage()
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                Text(recipe.name)
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 32))
                // MARK: Serving size picker
                VStack (alignment: .leading){
                    Text("Select your serving size")
                        .font(Font.custom("Avenir", size: 15))
                    Picker("Servings", selection: $selectedIndex){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                        .frame(width: 160)
                        .font(Font.custom("Avenir", size: 15))
                }.padding()
                 // Text("Selected servings: \(selectedIndex)")
                Divider()
                // MARK: Recipe ingredients
                VStack(alignment: .leading){
                    Text("Ingredients:")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding(.bottom,10)
                    ForEach(recipe.ingredients.allObjects as! [Ingredient]){ ingredient in
                        Text("• " + RecipeModel.getPortion(ingredient: ingredient, recipeServings: recipe.servings, targetServings: selectedIndex) + " " + ingredient.name.lowercased())
                            .padding(.bottom, 3)
                            .font(Font.custom("Avenir", size: 15))
                    }
                }.padding(.all)
                // MARK: Divider
                Divider()
                // MARK: Recipe ingredients
                VStack(alignment: .leading){
                    Text("Directions:")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding(.vertical,10)
                    ForEach(0..<recipe.directions.count, id: \.self){ index in
                        Text( String(index) + " " + recipe.directions[index])
                            .padding(.bottom, 5)
                            .font(Font.custom("Avenir", size: 15))
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
