//
//  TipsApp.swift
//  Tips

import SwiftUI

@main
struct TipsApp: App {
    
    @ObservedObject var appViewModel = AppViewModel()
    
    init() {
        if UserDefaults.standard.bool(forKey: "isLogin_Key") {
            appViewModel.isLogin = true
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if appViewModel.isLogin {
                MainView()
                    .environmentObject(appViewModel)
            } else {
                LoginView()
                    .environmentObject(appViewModel)
            }
        }
    }
}
