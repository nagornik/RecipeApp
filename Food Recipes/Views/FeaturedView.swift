//
//  FeaturedView.swift
//  Food Recipes
//
//  Created by Anton Nagornyi on 29.04.2022.
//

import SwiftUI

struct FeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        
        
        VStack (alignment: .leading, spacing: 0) {
//            Spacer()
            Text("Featured Recipes")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.leading)
                .padding(.top, 40)
            
            GeometryReader { geo in
                TabView {
                    ForEach (model.recipesArray) { index in
                        if index.featured {
                            
                            ZStack {
                                
                                Rectangle()
                                
                                VStack {
                                    Image(index.image)
                                        .resizable()
                                        .scaledToFill()
                                        .clipped()
                                    Text(index.name)
                                        .foregroundColor(.black)
                                        .padding(.bottom)
                                    
                                    
                                }
                                
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
                    .font(.headline)
                Text("1 hour")
                
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding([.leading, .bottom])
            
            
            
        }
        
        
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(RecipeModel())
    }
}
