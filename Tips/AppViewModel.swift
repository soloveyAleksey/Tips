//
//  AppViewModel.swift
//  Tips

import Foundation

final class AppViewModel: ObservableObject {
    
    @Published var isLogin = false {
        didSet {
            UserDefaults.standard.set(isLogin, forKey: "isLogin_Key")
        }
    }
}
