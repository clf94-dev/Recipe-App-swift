//
//  AddRecipeView.swift
//  Recipe-List-App
//
//  Created by Carmen Lucas on 12/9/23.
//

import SwiftUI

struct AddRecipeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var selectedTab: Int
    
    @State private var name = ""
    @State private var summary = ""
    @State private var prepTime = ""
    @State private var cookTime = ""
    @State private var totalTime = ""
    @State private var servings = ""
    
    @State private var highlights = [String]()
    @State private var directions = [String]()
    @State private var ingredients = [IngredientJSON]()
    
    @State private var isPickerVisible: Bool = false
    @State private var selectedImageSource = UIImagePickerController.SourceType.photoLibrary
    
    @State private var recipeImage: UIImage?
    var body: some View {
        VStack{
            HStack{
                Button("Clear"){
                    clearRecipe()
                    
                }
                Spacer()
                Button("Add"){
                    addRecipe()
                    clearRecipe()
                    selectedTab = Constants.listView
                }
            }
            ScrollView(showsIndicators: false){
                VStack{
                    if (recipeImage != nil){
                        Image(uiImage: recipeImage! )
                            .resizable()
                            .scaledToFit()
                    }else {
                        Image("noImageAvailable")
                            .resizable()
                            .scaledToFit()
                    }
                    HStack{
                        Button("Photo Library"){
                            selectedImageSource = UIImagePickerController.SourceType.photoLibrary
                            isPickerVisible = true
                        }
                        Text(" | ")
                        Button("Camera"){
                            selectedImageSource = UIImagePickerController.SourceType.camera
                            isPickerVisible = true
                        }
                        
                    }.sheet(isPresented: $isPickerVisible, content: {
                        ImagePicker(selectedSource: selectedImageSource, selectedImage: $recipeImage, isPickerVisible: $isPickerVisible)
                    })
                  
                  AddMetaData(name: $name, summary: $summary, prepTime: $prepTime, cookTime: $cookTime, totalTime: $totalTime, servings: $servings)
                    
                  AddListData(list: $highlights, title: "Highlights", placeholderText: "Vegetables")
                    
                  AddListData(list: $directions, title: "Directions", placeholderText: "Add oil to the pan")
                  AddIngredientData(ingredients: $ingredients)
                }
               
            }
        }.padding()
    }
    
    private func clearRecipe () {
        name = ""
        summary = ""
        prepTime = ""
        cookTime = ""
        totalTime = ""
        servings = ""
        
        highlights = [String]()
        directions = [String]()
        ingredients = [IngredientJSON]()
        recipeImage = nil
    }
    private func addRecipe() {
        let recipe = Recipe(context: viewContext)
        
        recipe.id = UUID()
        recipe.name = name
        recipe.summary = summary
        recipe.prepTime = prepTime
        recipe.cookTime = cookTime
        recipe.totalTime = totalTime
        recipe.servings = Int(servings) ?? 1
        recipe.directions = directions
        recipe.highlights = highlights
        recipe.image = recipeImage?.pngData()
        
        for i in ingredients {
            let ingredient = Ingredient(context: viewContext)
            ingredient.id = UUID()
            ingredient.name = i.name
            ingredient.num = i.num ?? 1
            ingredient.denom = i.denom ?? 1
            ingredient.unit = i.unit
            
            recipe.addToIngredients(ingredient)
        }
        
        
        do {
            try viewContext.save()
        }
        catch {
            // couldn't save recipe
        }
        
    }
}

