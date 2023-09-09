//
//  DataService.swift
//  Recipe List App
//
//  Created by Carmen Lucas on 17/6/23.
//

import Foundation

class DataService{
    static func getLocalData() -> [Recipe]{
        // Parse local json file
        
        return [Recipe]()
        //        // Get url path to the json file
        //        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        //
        //        //  Check if pathString is not nil, otherwise...
        //        guard pathString != nil else {
        //            return [Recipe]()
        //        }
        //        // Create a url object
        //        let pathUrl  = URL(fileURLWithPath: pathString!)
        //
        //        // Create a data object
        //        do {
        //            let data = try Data(contentsOf: pathUrl)
        //
        //            // Decode the data with a JSON decoder
        //            let decoder = JSONDecoder()
        //
        //            do {
        //                let recipeData = try decoder.decode([Recipe].self, from: data)
        //
        //                // Add unique IDs
        //                for r in recipeData {
        //                    r.id = UUID()
        //
        //                    // Add unique ids to recipe ingredients
        //                    for i in r.ingredients{
        //                        i.id = UUID()
        //                    }
        //
        //                }
        //                // Return the recipes
        //                return recipeData
        //            }
        //            catch{
        //                print(error)
        //            }
        //
        //        }
        //        catch{
        //            print(error)
        //        }
        //    return [Recipe]()
        //    }
    }
}
