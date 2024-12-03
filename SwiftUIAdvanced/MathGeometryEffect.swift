//
//  MathGeometryEffect.swift
//  SwiftUIAdvanced
//
//  Created by Adkhamjon Rakhimov on 03/12/24.
//

import SwiftUI

struct MathGeometryEffect: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namspace
    var body: some View {
        VStack{
            if !isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namspace)
                    .frame(width: 100,height: 100)
                    
            }
         
                
            
            Spacer()
            
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namspace)
                    .frame(width: 300,height: 200)
                    
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        .onTapGesture {
            withAnimation(.easeInOut){
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeomtryEffectExmaple2: View {
    
    let categories: [String] = ["Home", "Popular", "Saved"]
    
    @State private var selected: String = ""
    @Namespace private var namspace2

    var body: some View {
        HStack{
            ForEach(categories, id:\.self) { item in
            
                ZStack(alignment: .bottom) {
                    if selected == item {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "category_background", in: namspace2)
                            .frame(width: 35, height: 2)
                            .offset(y: 10)
                    }
                  
                    
                    Text(item)
                        .foregroundColor(selected == item ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring){
                        selected = item
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    MatchedGeomtryEffectExmaple2()
}
