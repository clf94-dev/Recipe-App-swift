//
//  AddRecipeView.swift
//  Recipe-List-App
//
//  Created by Carmen Lucas on 12/9/23.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var name = ""
    @State private var summary = ""
    @State private var prepTime = ""
    @State private var cookTime = ""
    @State private var totalTime = ""
    @State private var servings = ""
    
    @State private var highlights = [String]()
    @State private var directions = [String]()
    @State private var ingredients = [IngredientJSON]()
    var body: some View {
        VStack{
            HStack{
                Button("Clear"){
                    
                }
                Spacer()
                Button("Add"){
                    
                }
            }
            ScrollView(showsIndicators: false){
                VStack{
                  AddMetaData(name: $name, summary: $summary, prepTime: $prepTime, cookTime: $cookTime, totalTime: $totalTime, servings: $servings)
                    
                  AddListData(list: $highlights, title: "Highlights", placeholderText: "Vegetables")
                    
                  AddListData(list: $directions, title: "Directions", placeholderText: "Add oil to the pan")
                  AddIngredientData(ingredients: $ingredients)
                }
               
            }
        }.padding()
    }
}

#Preview {
    AddRecipeView()
}
