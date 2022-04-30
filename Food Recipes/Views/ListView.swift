//
//  ContentView.swift
//  Food Recipes
//
//  Created by Anton Nagornyi on 27.04.2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        
        
        NavigationView {
            VStack (alignment: .leading) {
                
                Text("All Recipes")
                    .font(Font.custom("Avenir Black", size: 26))
                    .fontWeight(.heavy)
                    .padding(.leading)
                    .padding(.top, 40)
                
                ScrollView {
                    
                    
                    
                    LazyVStack (alignment: .leading) {
                        ForEach (model.recipesArray) { p in
                            NavigationLink {
                                OneRecipeView(recipe: p)
                            } label: {
                                
                                SmallPreviews(recipe: p)
                                    .foregroundColor(.black)
                            }
                        }.padding(.leading)
                            
                    }
                }
            }.navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(RecipeModel())
    }
}
