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
    
}
