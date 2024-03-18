//
//  AppPetApp.swift
//  AppPet
//
//  Created by Alvaro Cuiza on 13/2/24.
//

import SwiftUI

@main
struct AppPetApp: App {
    @State var isPresenting = true
    var body: some Scene {
        WindowGroup {
            Home(presentSideMenu: $isPresenting)
        }
    }
}
