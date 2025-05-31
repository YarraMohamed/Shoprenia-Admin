//
//  AuthenticationViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import Foundation

class AuthenticationViewModel : AuthenticationViewModelProtocol {
    
    private let usecase : FetchAdminEmailAndPasswordUsecaseProtocol
    
    init() {
        UserDefaults.standard.set("Admin",forKey: "adminEmail")
        UserDefaults.standard.set( "12345678",forKey: "adminPassword")
        self.usecase = FetchAdminEmailAndPasswordUsecase()
    }
    
    func getAdminAuthenticationData() -> (email: String, password: String) {
        return usecase.excute()
    }
    
    func validatateAdminCredentials(email : String , password : String) -> Bool {
        let savedEmail = UserDefaults.standard.string(forKey: "adminEmail") ?? ""
        let savedPassword = UserDefaults.standard.string(forKey: "adminPassword") ?? ""
        if(email.isEmpty || password.isEmpty){
            return false
        }else if(email != savedEmail || password != savedPassword){
            return false
        }else{
            return true
        }
    }
    
}
