//
//  SideMenuView.swift
//  AppPet
//
//  Created by Alvaro Cuiza on 13/2/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: 270)
                    .shadow(color: .purple.opacity(0.1), radius: 5, x: 0, y: 3)
                VStack(alignment: .leading, spacing: 0) {
                    ProfileImageView()
                        .frame(height: 40)
                        .padding(.bottom, 30)
                    ForEach(SideMenuRowType.allCases, id: \.self){ row in
                        RowView(isSelected: selectedSideMenuTab == row.rawValue , imageName: row.iconName, title: row.title) {
                            selectedSideMenuTab = row.rawValue
                            presentSideMenu.toggle()
                        }
                    }
                    Spacer()
                }
                .padding(.top, 100)
                .frame(width: 270)
                .background(Color.white)
            }
            Spacer()
        }
        .background(.clear)
    }
    
}
extension SideMenuView {
    struct ProfileImageView:View {
        var body: some View {
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    Image(systemName: "person").resizable().aspectRatio(contentMode: .fill).frame(width: 100,height: 100)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke(.purple.opacity(0.5),lineWidth: 10)).cornerRadius(50)
                    Spacer()
                }
           
            }
            Text("Alvaro Cuiza")
                .font(.system(size: 18,weight: .bold))
                .foregroundColor(.black)
            Text("ios Developer")
                .font(.system(size: 14,weight: .semibold))
                .foregroundColor(.black.opacity(0.5))
        }
    }
}
extension SideMenuView {
    struct RowView: View {
        var isSelected: Bool
        var imageName: String
        var title: String
        var hideDivider: Bool = false
        var action: (()->())
        var body: some View {
            Button {
                action()
            } label: {
                VStack(alignment: .leading) {
                    HStack(spacing: 20) {
                        Rectangle()
                            .fill(isSelected ? .purple : .white)
                            .frame(width: 5)
                        ZStack {
                            Image(systemName: imageName)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(isSelected ? .black : .gray)
                                .frame(width: 26, height: 26)
                        }
                        .frame(width: 30, height: 30)
                        Text(title)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(isSelected ? .black : .gray)
                        Spacer()
                    }
                }
            }
            .frame(height: 50)
            .background(
                LinearGradient(colors: [isSelected ? .purple.opacity(0.5) : .white,.white ], startPoint: .leading, endPoint: .trailing)
            )
        }
    }
}

#Preview {
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    return SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)
}


