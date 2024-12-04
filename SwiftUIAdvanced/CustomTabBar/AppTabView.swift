//
//  CustomTabView(TabBar).swift
//  SwiftUIAdvanced
//
//  Created by Adkhamjon Rakhimov on 04/12/24.
//

import SwiftUI

// Custom TabView
// Generics
// ViewBuilder
// PreferenceKey
// MatchedGeometry

struct AppTabView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = TabBarItem(iconName: "house", title: "Home", color: Color.red)
    
    var body: some View {
        CustomTabBatContainerView(selection: $tabSelection) {
            Color.blue
                .tabBarItem(tab: TabBarItem(iconName: "house", title: "Home", color: Color.blue), selection: $tabSelection)
            
            Color.red
                .tabBarItem(tab: TabBarItem(iconName: "heart", title: "Favorites", color: Color.red),selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: TabBarItem(iconName: "person", title: "Profile", color: Color.green),selection: $tabSelection)
        }
    }
}

extension AppTabView {
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    AppTabView()
}
