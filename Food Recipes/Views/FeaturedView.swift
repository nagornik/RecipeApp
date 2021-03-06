//
//  FeaturedView.swift
//  Food Recipes
//
//  Created by Anton Nagornyi on 29.04.2022.
//

import SwiftUI

struct FeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isOneRecipeShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .font(Font.custom("Avenir Black", size: 26))
//                .fontWeight(.heavy)
                .padding(.leading)
                .padding(.top, 40)
            
            GeometryReader { geo in
                TabView (selection: $tabSelectionIndex) {
                    ForEach (0..<model.recipesArray.count) { index in
                        if model.recipesArray[index].featured {
                            Button {
                                self.isOneRecipeShowing = true
                            } label: {
                                ZStack {
                                    
                                    Rectangle()
                                    
                                    VStack {
                                        Image(model.recipesArray[index].image)
                                            .resizable()
                                            .scaledToFill()
                                            .clipped()
                                        Text(model.recipesArray[index].name)
                                            .foregroundColor(.black)
                                            .padding(.bottom)
                                    }
                                }
                            }
                            .tag(index)
                            .sheet(isPresented: $isOneRecipeShowing) {
                                OneRecipeView(recipe: model.recipesArray[index])
                            }
                            .foregroundColor(.white)
                            .frame(width: geo.size.width-40, height: geo.size.height-100)
                            .cornerRadius(15)
                            .shadow(color: Color(.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)), radius: 10, x: -5, y: 5)
                            
                        }
                    }
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    
            }
            
            VStack (alignment: .leading, spacing: 10) {
                
                Text("Preparation Time:")
                    .font(Font.custom("Avenir Heavy", size: 18))
                Text(model.recipesArray[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 16))
                
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 18))
                Text(model.recipesArray[tabSelectionIndex].highlights.joined(separator: ", "))
                    .font(Font.custom("Avenir", size: 16))
            }
            .padding([.leading, .bottom])
            .onAppear(perform: firstFeaturedIndex)
            
        }
        
    }
    
    func firstFeaturedIndex() {
        let index = model.recipesArray.firstIndex { recipe in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }

}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(RecipeModel())
    }
}
