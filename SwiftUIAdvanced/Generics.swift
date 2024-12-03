//
//  Generics.swift
//  SwiftUIAdvanced
//
//  Created by Adkhamjon Rakhimov on 03/12/24.
//

import SwiftUI

struct StringModel {
    let info: String?
    
    func removeInfo() -> StringModel {
        StringModel(info: nil)
    }
}

struct GenericModel<T> {
    let info: T?
    
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    @Published var stringModel = StringModel(info: "Hello world")
    @Published var genericStringModel = GenericModel(info: "Hello world")
    @Published var genericBoolModel = GenericModel(info: true)
    
//    @Published var dataArray: [String] = []
//
//    init() {
//        dataArray = ["one", "two", "three"]
//    }
//    
//    func removeDataFromArray() {
//        dataArray.removeAll()
//    }
    
    
    func removeData() {
        stringModel = stringModel.removeInfo()
    }
    
}

struct GenericView<T:View> :View {
    let content: T
    let title:String
    
    var body: some View {
        VStack {
            Text(title)
            content
        }
    }
}

struct Generics: View {
    
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
//            ForEach(vm.dataArray, id: \.self) { item in
//            
//                Text(item)
//                    .onTapGesture {
//                        vm.removeDataFromArray()
//                    }
//                
//            }
            
            GenericView(content: Text("Hi there generics"), title: "title")
            
            Text(vm.genericStringModel.info ?? "no data")
            Text(vm.genericBoolModel.info?.description ?? "no data")
                
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

#Preview {
    Generics()
}
