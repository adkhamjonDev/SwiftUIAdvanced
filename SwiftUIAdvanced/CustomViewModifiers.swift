//
//  CustomViewModifiers.swift
//  SwiftUIAdvanced
//
//  Created by Adkhamjon Rakhimov on 03/12/24.
//

import SwiftUI

struct CustomViewModifiers: View {
    var body: some View {
        VStack {
            
//            Text("Hello, World!")
//                .font(.headline)
//                .foregroundColor(.white)
//                .frame(height: 55)
//                .frame(maxWidth: .infinity)
//                .background(.blue)
//                .cornerRadius(10)
//                .shadow(radius: 10)
//                .padding()
            
            
            Text("Hello, World!")
                .withDefaultButtonFormatting()
                //.modifier(DefaultButtonViewModifier())

            Text("Hello, Everyone!")
                .modifier(DefaultButtonViewModifier(backgroundColor: .red))

            Text("Hello!!!")
                .modifier(DefaultButtonViewModifier(backgroundColor: .yellow))

            
        }
    }
}

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    func withDefaultButtonFormatting() -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: .blue))
    }
}

#Preview {
    CustomViewModifiers()
}
