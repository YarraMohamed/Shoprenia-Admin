//
//  HomeViewModle.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import Foundation
import Shopify
import Combine

class HomeViewModel : ObservableObject {
    
    let usecase : FetchAllVendorsUsecase
    
    @Published var vendors : [VendorEntity] = []
    @Published var filteredVendors : [VendorEntity] = []
    @Published var searchText : String = ""
    private var cancellables : Set<AnyCancellable> = []
    func getAllVendors() {
        usecase.execute { [weak self ] result in
                switch result {
                case .success(let vendors):
                    self?.vendors = vendors.dropFirst().dropLast(4)
                case .failure(let error):
                    print("Error is : \(error.localizedDescription)")
                }
        }
        
    }
    
    private func addSubscribers(){
        $searchText
            .combineLatest(self.$vendors)
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { searchText, vendors in
                guard !searchText.isEmpty else {
                    self.filteredVendors = vendors
                    return
                }
                let filteredVendors = vendors.filter {$0.title?.lowercased().contains(searchText.lowercased()) ?? false}
                self.filteredVendors = filteredVendors
            }.store(in: &cancellables)
    }
    
    init(usecase: FetchAllVendorsUsecase) {
        self.usecase = usecase
        addSubscribers()
    }
    
}
