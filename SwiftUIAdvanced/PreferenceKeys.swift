//
//  PreferenceKey.swift
//  SwiftUIAdvanced
//
//  Created by Adkhamjon Rakhimov on 04/12/24.
//

import SwiftUI

struct PreferenceKeys: View {
    
    @State private var text: String = "Hello world!"
    
    var body: some View {
        NavigationStack {
            VStack {
                SecondaryScreen(text: text)
                .navigationTitle("Navigation title")
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
            self.text = value
        }
    }
}

extension View {
    
    func customTitle(_ text: String) -> some View {
       preference(key: CustomTitlePreferenceKey.self, value: text)
    }
    
}
#Preview {
    PreferenceKeys()
}

struct SecondaryScreen: View {
    let text: String
    @State private var newValue: String = ""
    var body: some View {
        Text(text)
            .onAppear{
                getDataFromDatabase()
            }
            .customTitle(newValue)
    }
    func getDataFromDatabase() {
        // download fake data
        DispatchQueue.main.asyncAfter(deadline: .now()+2.0){
            self.newValue = "NEW VALUE FROM DATABASE"
        }
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}
