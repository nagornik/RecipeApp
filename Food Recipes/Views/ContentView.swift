//
//  ContentView.swift
//  Food Recipes
//
//  Created by Anton Nagornyi on 27.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            List (model.recipesArray) { p in
                NavigationLink {
                    OneRecipeView(recipe: p)
                } label: {
                    
                    SmallPreviews(recipe: p)
                }
            }.navigationBarTitle("All Recipes")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
