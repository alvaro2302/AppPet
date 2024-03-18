//
//  SideMenu.swift
//  AppPet
//
//  Created by Alvaro Cuiza on 13/2/24.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isShowing: Bool
    var content: AnyView
    var edgeTransition: AnyTransition = .move(edge: .leading)
    var body: some View {
        ZStack(alignment: .bottom ) {
            if (isShowing) {
                Color.black.opacity(0.3).ignoresSafeArea().onTapGesture {
                    isShowing.toggle()
                }
            }
            content.transition(edgeTransition)
                .background(
                    Color.clear
                )
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
   
}

#Preview {
    @State var isShowing = false
    @State var selectedSideMenuTab = 0
    @State var presentSideMenu = false
    return SideMenu(isShowing: $isShowing,content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
}
