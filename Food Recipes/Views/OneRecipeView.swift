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
    @EnvironmentObject var model:RecipeModel
    @State var servingsSelected = 2
    
    var body: some View {
       
        ScrollView {
        LazyVStack (alignment: .leading) {
            
            
            
                VStack {
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: .infinity, height: 350, alignment: .center)
//                    Spacer()
                }
                
                VStack (alignment: .leading) {
                   
                    Text(recipe.name)
                        .padding(.top)
                        .font(Font.custom("Avenir Black", size: 26))
//                        .foregroundColor(.black)
                    Text(recipe.description)
                        .font(Font.custom("Avenir", size: 16))
//                        .foregroundColor(.black)
                    Divider()
                        .padding()
                    
                    HStack {
                        Text("Preparation")
                        Spacer()
                        Text("Total")
                            .multilineTextAlignment(.trailing)
                    }.padding(.bottom, 1)
                        .font(Font.custom("Avenir Heavy", size: 18))
                        .overlay(Text("Cooking").font(Font.custom("Avenir Heavy", size: 18)))
                    HStack {
                        Text(recipe.prepTime)
                        Spacer()
                        Text(recipe.totalTime)
                    }.overlay(Text(recipe.cookTime).font(Font.custom("Avenir", size: 16)))
                        .font(Font.custom("Avenir", size: 16))
                    Divider()
                        .padding()
                    
                    Text("Portion size")
                        .font(Font.custom("Avenir Heavy", size: 18))
                    
                    GeometryReader { geo in
                    
                        Picker ("", selection: $servingsSelected) {
                            Text("2").tag(2)
                            Text("4").tag(4)
                            Text("6").tag(6)
                            Text("8").tag(8)
                        }.pickerStyle(SegmentedPickerStyle())
                            .font(Font.custom("Avenir", size: 16))
                            .frame(width: geo.size.width/2)
                    }.padding(.bottom)
                        .padding(.bottom)
                    
                    Button {
                        ingredientsShow = !ingredientsShow
                    } label: {
                        VStack(alignment: .leading) {
                        Text("Ingredients")
                            .font(Font.custom("Avenir Heavy", size: 18))
                            .padding(.bottom)
                            .foregroundColor(Color.black)
                        
                            ForEach (recipe.ingredients) { index in
                                Text("• " + RecipeModel.getPortion(ingredient: index, recipeServings: recipe.servings, targetServings: servingsSelected) + " " + index.name.lowercased())
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.black)
                                    .font(Font.custom("Avenir", size: 16))
                            }.opacity(ingredientsShow ? 1 : 1)
                        }.frame(height: ingredientsShow ? .infinity : 150, alignment: .topLeading)
                            .mask(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(ingredientsShow ? 1 : 0)]), startPoint: .top, endPoint: .bottom))
                    }
                    
                    Button {
                        directionsShow = !directionsShow
                    } label: {
                        VStack(alignment: .leading) {
                        Text("Directions")
                            .font(Font.custom("Avenir Heavy", size: 18))
                            .padding(.vertical)
                            .foregroundColor(Color.black)
                        
                            ForEach (recipe.directions, id: \.self) { index in
                                Text("• "+index)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.black)
                                    .font(Font.custom("Avenir", size: 16))
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
                .foregroundColor(.black)
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
        OneRecipeView(recipe: recipe.recipesArray[1])
            .environmentObject(RecipeModel())
    }
}
