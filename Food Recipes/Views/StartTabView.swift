//
//  TabView.swift
//  Food Recipes
//
//  Created by Anton Nagornyi on 29.04.2022.
//

import SwiftUI

struct StartTabView: View {
    
    @State var tabIndex = 0
    
    var body: some View {
        
        
        TabView(selection: $tabIndex) {
            
            FeaturedView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
                .tag(0)
            
            ListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
                .tag(1)
            
        }
        
        
    }
        
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        StartTabView()
            .environmentObject(RecipeModel())
    }
}
