//
//  FetchAllVendorsUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 16/06/2025.
//

import Foundation

protocol FetchAllVendorsUsecase{
    func execute(completionHandler : @escaping (Result<[VendorEntity],Error>)->Void)
}
