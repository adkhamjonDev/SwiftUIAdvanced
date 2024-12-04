//
//  ViewBuilders.swift
//  SwiftUIAdvanced
//
//  Created by Adkhamjon Rakhimov on 04/12/24.
//

import SwiftUI


struct HeaderViewRegular: View {
    
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading ) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            
            if let iconName = iconName {
                Image(systemName: iconName)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct HeaderViewGeneric<Content: View>: View {
    
    let title: String
    let content: Content

    init(title: String,@ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading ) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CustomHStack<Content: View> : View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
    
}

struct ViewBuilders: View {
    var body: some View {
        
        VStack {
           
            HeaderViewRegular(title: "New title", description: "Hello", iconName: "heart.fill")
            HeaderViewRegular(title: "Another title", description: nil, iconName: nil)
            
            
            HeaderViewGeneric(title: "Generic title", content: {
                Text("Hello")
            })
            
            HeaderViewGeneric(title: "Generic title2", content: {
                Image(systemName: "heart.fill")
            })
            
            HeaderViewGeneric(
                title: "Generic title3") {
                    HStack {
                        Text("hellooo")
                        Image(systemName: "bolt.fill")
                    }
                }
             
            CustomHStack {
                Text("HI")
                Text("HI")
            }
            
            Spacer()
          
        }
       
        
        
    }
}



struct LocalViewBuilder: View {
    
    enum ViewType {
        case one, two ,three
    }
    
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
           
        }
    }
    
    // local view builder
    @ViewBuilder private var headerSection: some View {
        
        switch type {
        case .one:
            viewOne
        case .two:
            viewTwo
        case .three:
            viewThree
        }
        
    }
    
    private var viewOne: some View {
        Text("One!")
    }
    
    private var viewTwo: some View {
        VStack {
            Text("TWOOO")
            Image(systemName: "heart.fill")
        }
    }
    
    private var viewThree: some View {
        Image(systemName: "heart.fill")
    }
}

#Preview {
    LocalViewBuilder(type: .three)
}
