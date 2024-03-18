//
//  ProfileView.swift
//  AppPet
//
//  Created by Alvaro Cuiza on 17/3/24.
//

import SwiftUI

struct ProfileView: View {
    @State var urlImage: String
    @State var name: String
    @State var direction: String
    var body: some View {
        HStack{
            
            Image(systemName: urlImage).resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50, alignment: .leading).cornerRadius(20).padding(5)
            VStack(alignment: .leading, spacing: 5){
                Text(name).font(.title).fontWeight(.bold).frame(width: .infinity,height: .infinity)
                Text(direction).fontWeight(.light).multilineTextAlignment(.leading).frame(width:.infinity,height: .infinity, alignment: .leading)
                
            }
           
        }
    }
}

#Preview {
    ProfileView(urlImage: "person.crop.circle",name:"Karen S",direction: "Kuta Bail, Indonesia")
}
