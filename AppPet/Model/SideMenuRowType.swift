//
//  SideMenuRowType.swift
//  AppPet
//
//  Created by Alvaro Cuiza on 13/2/24.
//

import Foundation
enum SideMenuRowType: Int, CaseIterable {
    case home = 0
    case favorite
    case chat
    case profile
    
    var title: String {
        switch self {
        case .home:
            return "Home"
            
        case .favorite:
            return "Favorite"
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"
        }
        

    }
    var iconName: String {
        switch self {
        case .home:
            return "house.fill"
        case .favorite:
            return "star.fill"
        case .chat:
            
            return "message.badge.circle"
        case .profile:
            return "person.crop.circle"
        }
    }
}
