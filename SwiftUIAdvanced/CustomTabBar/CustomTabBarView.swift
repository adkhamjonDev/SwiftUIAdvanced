//
//  CustomTabBarView.swift
//  SwiftUIAdvanced
//
//  Created by Adkhamjon Rakhimov on 04/12/24.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    
    @Binding var selection: TabBarItem
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
            
                TabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
                
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}
extension CustomTabBarView {
    private func TabView(tab:TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeInOut){
            selection = tab
        }
    }
}

struct TabBarItem: Hashable {
    let iconName: String
    let title: String
    let color: Color
}

#Preview {
    VStack {
        Spacer()
        
        CustomTabBarView(tabs:
                            [
                                TabBarItem(iconName: "house", title: "Home", color: Color.red),
                                TabBarItem(iconName: "heart", title: "Favorites", color: Color.blue),
                                TabBarItem(iconName: "person", title: "Profile", color: Color.green),
                            ],
                         selection: .constant(TabBarItem(iconName: "house", title: "Home", color: Color.red))
        )
    }
}
