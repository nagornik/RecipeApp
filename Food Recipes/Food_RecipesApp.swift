//
//  Food_RecipesApp.swift
//  Food Recipes
//
//  Created by Anton Nagornyi on 27.04.2022.
//

import SwiftUI

@main
struct Food_RecipesApp: App {
    var body: some Scene {
        WindowGroup {
            StartTabView()
                .environmentObject(RecipeModel())
        }
    }
}
