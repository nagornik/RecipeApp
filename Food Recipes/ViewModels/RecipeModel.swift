//
//  RecipeModel.swift
//  Food Recipes
//
//  Created by Anton Nagornyi on 27.04.2022.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipesArray = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipesArray = DataService.getLocalData()
        
        
    }
}
