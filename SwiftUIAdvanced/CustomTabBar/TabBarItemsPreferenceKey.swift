//
//  TabBarItemsPreferencekey.swift
//  SwiftUIAdvanced
//
//  Created by Adkhamjon Rakhimov on 04/12/24.
//

import SwiftUI
import Foundation



class TabBarItemsPreferenceKey: PreferenceKey {
    static var defaultValue: [TabBarItem] = []
    static func reduce(value: inout Value, nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}

struct TabBarItemViewModifier: ViewModifier {
    
    let tab: TabBarItem
    
    @Binding var selection: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
    }
    
}

extension View {
    func tabBarItem(tab: TabBarItem,selection: Binding<TabBarItem>) -> some View {
        modifier(TabBarItemViewModifier(tab: tab, selection: selection))
    }
}
