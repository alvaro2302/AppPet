//
//  CategoryView.swift
//  AppPet
//
//  Created by Alvaro Cuiza on 21/3/24.
//

import SwiftUI

struct CategoryView: View {
    @State var name: String

    var body: some View {
        Button(action: {print("push button")}, label: {
            VStack {
                
             
             VStack{
                 Image(systemName: "pawprint").resizable().aspectRatio(contentMode: .fill).foregroundColor(Color.black).frame(width: 20, height: 20, alignment: .leading).padding(10)
               
             }.frame(width: 50,height: 50).background().cornerRadius(25)
                Text(name).foregroundStyle(.black).padding(10)
            }.frame(width: 65, height: 110).background(Color(red: 223/255, green: 201/255, blue: 222/255)).cornerRadius(30)
        })
    }
}

#Preview {
    CategoryView(name: "All")
}
