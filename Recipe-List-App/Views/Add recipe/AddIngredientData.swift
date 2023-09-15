//
//  AddIngredientData.swift
//  Recipe-List-App
//
//  Created by Carmen Lucas on 15/9/23.
//

import SwiftUI

struct AddIngredientData: View {
    @Binding var ingredients: [IngredientJSON]
    
    @State private var name: String = ""
    @State private var num: String = ""
    @State private var denom: String = ""
    @State private var unit: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Ingredients: ")
                .bold()
                .padding(.top, 5)
            HStack{
                TextField("Sugar", text: $name)
                TextField("1", text: $num)
                    .frame(width: 20)
                Text("/")
                TextField("1", text: $denom)
                    .frame(width: 20)
                TextField("g", text: $unit)
                
                Button("Add") {
                    
                    let cleanedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
                    let cleanedNum = num.trimmingCharacters(in: .whitespacesAndNewlines)
                    let cleanedDenom = denom.trimmingCharacters(in: .whitespacesAndNewlines)
                    let cleanedUnit = unit.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    if (cleanedName == "" || cleanedNum == "" || cleanedDenom == "" || cleanedUnit == "") {
                        return
                    }
                    
                    let ingredient = IngredientJSON()
                    ingredient.id = UUID()
                    ingredient.name = cleanedName
                    ingredient.num = Int(cleanedNum) ?? 1
                    ingredient.denom = Int(cleanedDenom) ?? 1
                    ingredient.unit = cleanedUnit
                    
                    ingredients.append(ingredient)
                    
                    name = ""
                    num = ""
                    denom = ""
                    unit = ""
                }
                
            }
            ForEach(ingredients){ ing in
                Text("\(ing.name), \(ing.num ?? 1) / \(ing.denom ?? 1) \(ing.unit ?? "")")
            }
        }
    }
}


