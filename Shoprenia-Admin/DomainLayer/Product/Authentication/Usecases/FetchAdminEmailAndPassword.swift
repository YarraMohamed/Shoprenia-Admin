//
//  FetchAdminEmailAndPassword.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import Foundation

class FetchAdminEmailAndPasswordUsecase : FetchAdminEmailAndPasswordUsecaseProtocol {
    
    func excute() -> (email: String, password: String) {
        let userDefault = UserDefaults.standard
        userDefault.set("shopreniaAdmin@gmail.com", forKey: "adminEmail")
        userDefault.set("123456789", forKey: "adminPassword")
        
        let email = userDefault.string(forKey: "adminEmail") ?? ""
        let password = userDefault.string(forKey: "adminPassword") ?? ""
        return (email: email, password: password)
    }
    
}
