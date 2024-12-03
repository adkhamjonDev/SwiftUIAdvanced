//
//  CustomShapes.swift
//  SwiftUIAdvanced
//
//  Created by Adkhamjon Rakhimov on 03/12/24.
//

import SwiftUI

struct CustomShapes: View {
    var body: some View {
        ZStack {

//            Image("silo")
//                .resizable()
//                .scaledToFill()
//            
            Diamond()
//                .fill(LinearGradient(
//                    gradient: Gradient(colors: [.red,.blue]), startPoint: .leading, endPoint: .trailing
//                ))
                //.stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [10]))
                
                .frame(width: 300, height: 300)
 //               .clipShape(Triangle().rotation(Angle(degrees: 180)))
            
            
        }
    }
}

struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX,y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX,y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX,y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX,y: rect.minY))
        }
    }
    
    
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX,y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset,y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX,y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset,y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX,y: rect.minY))

        }
    }
}


#Preview {
    CustomShapes()
}
