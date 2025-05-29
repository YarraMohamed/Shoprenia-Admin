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
        
        self.usecase = FetchAdminEmailAndPasswordUsecase()
    }
    
    func getAdminAuthenticationData() -> (email: String, password: String) {
        return usecase.excute()
    }
    
    
}
