//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Carmen Lucas on 17/6/23.
//

import Foundation
import UIKit

class RecipeModel: ObservableObject{
    @Published var recipes = [Recipe]()
    
    let managedObjectContext = PersistenceController.shared.container.viewContext
  
    init() {
        // Create an instance of data service and get the data
        
        // -> without static
        // let service = DataService()
        // self.recipes = service.getLocalData()
        
        // with static
        // self.recipes = DataService.getLocalData()
        checkLoadedData()
    }
    
    func checkLoadedData(){
        // Check local storage for the flag
        let status = UserDefaults.standard.bool(forKey: Constants.isDataPreloaded)
        
        // If it's false, then we should parse the local json and preload in CoreData
        
        if status == false {
            preloadLocalData()
        }
    }
    
    func preloadLocalData() {
        // parse the local json data
        let localRecipes = DataService.getLocalData()
        // create core data objects
        for r in localRecipes {
            
            // create a core data object
            let recipe = Recipe(context: managedObjectContext)
            
            // set its properties
            recipe.name = r.name
            recipe.directions = r.directions
            recipe.highlights = r.highlights
            recipe.id = UUID()
            recipe.image = UIImage(named: r.image)?.jpegData(compressionQuality: 1.0)
            recipe.featured = r.featured
            recipe.prepTime = r.prepTime
            recipe.servings = r.servings
            recipe.cookTime = r.cookTime
            recipe.summary = r.description
            recipe.totalTime = r.totalTime
            
            // set ingredients
            for i in r.ingredients {
                // create core data ingredient object
                let ingredient = Ingredient(context: managedObjectContext)
                
                ingredient.id = UUID()
                ingredient.name = i.name
                ingredient.unit = i.unit
                ingredient.num = i.num ?? 1
                ingredient.denom = i.denom ?? 1
                
                // add this ingredient to the recipe
                recipe.addToIngredients(ingredient)
            }
        }
        // save into core data
        do {
            try managedObjectContext.save()
            
            // set local storage flag
            UserDefaults.standard.setValue(true, forKey: Constants.isDataPreloaded)
        } catch {
            // couldn't save to core data
        }
        
    }
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String{
        var portion = ""
        var numerator = ingredient.num
        var denominator = ingredient.denom
        var wholePortions = 0
        
       
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
