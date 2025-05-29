//
//  AuthenticationViewModelProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import Foundation

protocol AuthenticationViewModelProtocol {
    
    func getAdminAuthenticationData() -> (email : String , password : String)
    func validatateAdminCredentials(email : String , password : String) -> Bool
}
