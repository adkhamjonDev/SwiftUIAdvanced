//
//  CustomButtonStyle.swift
//  SwiftUIAdvanced
//
//  Created by Adkhamjon Rakhimov on 03/12/24.
//

import SwiftUI

struct CustomButtonStyle: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click me")
                .withDefaultButtonFormatting()
        }
        //.buttonStyle(DefaultButtonStyle())
        //.buttonStyle(PlainButtonStyle())
        //.buttonStyle(ButtonPressableStyle(scaledAmount: 0.95))
        
        .padding()

    }
}


struct ButtonPressableStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat = 0.5) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            //.opacity(configuration.isPressed ? 0.9 : 1.0)
            //.brightness(configuration.isPressed ? 0.05 : 0)
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
    }
}

extension View {
    func withPressableStyle() -> some View {
        self.buttonStyle(ButtonPressableStyle())
    }
}

#Preview {
    CustomButtonStyle()
}
