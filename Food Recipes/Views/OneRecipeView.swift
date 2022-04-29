//
//  OneRecipeView.swift
//  Food Recipes
//
//  Created by Anton Nagornyi on 27.04.2022.
//

import SwiftUI

struct OneRecipeView: View {
    
    var recipe:Recipe
    @State var ingredientsShow = false
    @State var directionsShow = false
    
    
    
    var body: some View {
       
        ScrollView {
        VStack (alignment: .leading) {
            
            
            
                VStack {
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: .infinity, height: 350, alignment: .center)
                    Spacer()
                }
                
                VStack (alignment: .leading) {
                   
                    Text(recipe.name)
                        .padding(.top)
                        .font(.title.bold())
                    Text(recipe.description)
                        .font(.body)
                        
                    Divider()
                        .padding()
                    
                    HStack {
                        Text("Preparation")
                        Spacer()
                        Text("Total")
                            .multilineTextAlignment(.trailing)
                    }.padding(.bottom, 1)
                        .font(.body.bold())
                        .overlay(Text("Cooking").font(.body.bold()))
                    HStack {
                        Text(recipe.prepTime)
                        Spacer()
                        Text(recipe.totalTime)
                    }.overlay(Text(recipe.cookTime))
                    Divider()
                        .padding()
                    
                    
                    Button {
                        ingredientsShow = !ingredientsShow
                    } label: {
                        VStack(alignment: .leading) {
                        Text("Ingredients")
                            .font(.headline)
                            .padding(.bottom)
                            .foregroundColor(Color.black)
                        
                            ForEach (recipe.ingredients) { index in
                                Text("• "+index.name)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.black)
                            }.opacity(ingredientsShow ? 1 : 1)
                        }.frame(height: ingredientsShow ? .infinity : 150, alignment: .topLeading)
                            .mask(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(ingredientsShow ? 1 : 0)]), startPoint: .top, endPoint: .bottom))
                    }
                    
                    Button {
                        directionsShow = !directionsShow
                    } label: {
                        VStack(alignment: .leading) {
                        Text("Directions")
                            .font(.headline)
                            .padding(.vertical)
                            .foregroundColor(Color.black)
                        
                            ForEach (recipe.directions, id: \.self) { index in
                                Text("• "+index)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.black)
                                    .padding(.bottom, directionsShow ? 1:0)
                            }.opacity(directionsShow ? 1 : 1)
                                
                        }
                        .frame(height: directionsShow ? .infinity : 150, alignment: .topLeading)
                        .padding(.bottom, 100)
                            .mask(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(directionsShow ? 1 : 0)]), startPoint: .top, endPoint: .bottom))
                    }
                    
                    
                    
                }
                .padding([.leading, .trailing], 20.0)
                .padding(.bottom)
                .background(Color.white)
                .cornerRadius(20)
                .padding(.top, -20)
                
                
            }
        }.ignoresSafeArea()
    }
    
//    func showIngredients() {
//        if ingredientsShow == true {
//           ingredientsShow = false
//        } else {
//            ingredientsShow = true
//        }
//    }
    
}

struct OneRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let recipe = RecipeModel()
        OneRecipeView(recipe: recipe.recipesArray[4])
    }
}
