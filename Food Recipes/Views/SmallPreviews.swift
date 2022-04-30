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
                .frame(width: 60, height: 60, alignment: .center)
                .cornerRadius(10)
                .scaledToFill()

            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(Font.custom("Avenir Heavy", size: 18))
//                    .fontWeight(.medium)
                Text(recipe.highlights.joined(separator: ", "))
                    .font(Font.custom("Avenir Book", size: 14))
                Text("Cook time: "+recipe.totalTime)
                    .font(Font.custom("Avenir Light", size: 14))
            }
        }
    }
}

struct SmallPreviews_Previews: PreviewProvider {
    static var previews: some View {
        let smallImg = RecipeModel()
        SmallPreviews(recipe: smallImg.recipesArray[0])
    }
}
