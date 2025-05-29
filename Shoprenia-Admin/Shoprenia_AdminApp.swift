//
//  Shoprenia_AdminApp.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 27/05/2025.
//

import SwiftUI

@main
struct Shoprenia_AdminApp: App {
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(named: "shopreniaBlue") ?? ""]
    }
    var body: some Scene {
        WindowGroup {
           AuthenticationScreen()
        }
    }
}
