//
//  SmallPreviews.swift
//  Food Recipes
//
//  Created by Anton Nagornyi on 27.04.2022.
//

import SwiftUI


struct SmallPreviews: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        HStack {
            Image(recipe.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 45, height: 45, alignment: .center)
                .cornerRadius(10)
                .scaledToFill()

            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text("Cooking time: "+recipe.totalTime)
                    .font(.caption)
            }
        }.padding(.vertical, 5)
    }
}

struct SmallPreviews_Previews: PreviewProvider {
    static var previews: some View {
        let smallImg = RecipeModel()
        SmallPreviews(recipe: smallImg.recipesArray[0])
    }
}
