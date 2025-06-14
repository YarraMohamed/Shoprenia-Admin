//
//  FetchAdminEmailAndPasswordProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import Foundation


protocol FetchAdminEmailAndPasswordUsecaseProtocol {
    func excute() -> (email: String, password: String)
}
