//
//  SearchView.swift
//  AppPet
//
//  Created by Alvaro Cuiza on 17/3/24.
//

import SwiftUI

struct SearchView: View {
    @State var foreground: String
    @State var urlIconSearch: String
    @State var urlIconImage: String
    @State private var searchWord: String = ""
    var body: some View {
        VStack{
            
            HStack{
                Image(systemName: urlIconSearch).resizable().aspectRatio(contentMode: .fill).frame(width: 20, height: 20, alignment: .leading).padding()
               TextField(foreground,text: $searchWord).frame(width: 180,alignment: .leading).padding(10)
                   
            
                Image(systemName: urlIconImage).resizable().aspectRatio(contentMode: .fill).frame(width: 20, height: 20, alignment: .leading).padding()
            }
        }.background(Color(red: 246/255, green: 246/255, blue: 246/255)).cornerRadius(20)
    }
}

#Preview {
    SearchView(foreground: "Search here", urlIconSearch: "magnifyingglass", urlIconImage: "location.circle.fill")
}
