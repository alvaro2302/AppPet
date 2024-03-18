//
//  MainTabbedView.swift
//  AppPet
//
//  Created by Alvaro Cuiza on 13/2/24.
//

import SwiftUI

struct MainTabbedView: View {
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
        
        var body: some View {
            ZStack{
                
                TabView(selection: $selectedSideMenuTab) {
                    Home(presentSideMenu: $presentSideMenu)
                        .tag(0)
                }
                .background(.yellow)
                
                if presentSideMenu {
                    SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
                }
            }
        }
}

#Preview {
    MainTabbedView()
}
