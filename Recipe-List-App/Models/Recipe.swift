//
//  Recipe.swift
//  Recipe List App
//
//  Created by Carmen Lucas on 17/6/23.
//

import Foundation

class RecipeJSON: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[IngredientJSON]
    var directions: [String]
    var highlights:[String]
}

class IngredientJSON: Identifiable, Decodable{
    var id:UUID?
    var name: String
    var num:Int?
    var unit:String?
    var denom:Int?
    
    init() {
        name = ""
    }
}
