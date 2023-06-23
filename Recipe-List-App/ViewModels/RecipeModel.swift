//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Carmen Lucas on 17/6/23.
//

import Foundation

class RecipeModel: ObservableObject{
    @Published var recipes = [Recipe]()
  
    
    init() {
        // Create an instance of data service and get the data
        
        // -> without static
        // let service = DataService()
        // self.recipes = service.getLocalData()
        
        // with static
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String{
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if(ingredient.num != nil)
        {
            denominator *= recipeServings
            numerator *= targetServings
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            
            numerator /= divisor
            denominator /= divisor
            
            if numerator >= denominator{
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            
            if(numerator > 0 && denominator > 1){
                portion += wholePortions > 0 ?" ": ""
                portion += "\(numerator)/\(denominator)"
            }
            
            
        }
        if var unit = ingredient.unit {
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(2) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                    
                } else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
            
    
        
        return portion
        
    }
    
}
