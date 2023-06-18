//
//  Recipe.swift
//  Recipe List App
//
//  Created by Carmen Lucas on 17/6/23.
//

import Foundation

class Recipe: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[Ingredient]
    var directions: [String]
    var highlights:[String]
}

class Ingredient: Identifiable, Decodable{
    var id:UUID?
    var name: String
    var num:Int?
    var unit:String?
    var denom:Int?
}
