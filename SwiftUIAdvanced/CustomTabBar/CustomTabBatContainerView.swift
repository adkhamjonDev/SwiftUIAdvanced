//
//  CustomTabBatContainerView.swift
//  SwiftUIAdvanced
//
//  Created by Adkhamjon Rakhimov on 04/12/24.
//

import SwiftUI


struct CustomTabBatContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
            }
            CustomTabBarView(tabs: tabs, selection: $selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

#Preview {
    CustomTabBatContainerView(
        selection:
                .constant(TabBarItem(iconName: "house", title: "Home", color: Color.red))
    ) {
            Color.red
        }
}
