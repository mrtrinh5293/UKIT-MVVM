//
//  CountryViewModels.swift
//  praticeUIKITxx
//
//  Created by duc on 2021-10-20.
//

import Foundation
import UIKit
class CountryVIewModel: NSObject {
    let searchController = UISearchController()
    
    private var networkManager: NetworkManager!
    
    private(set) var filteredTableData: [WorldData]! {
        didSet {
            self.bindCountryViewModelToController()
        }
    }
    private(set) var countryData: [WorldData]! {
        didSet {
            self.bindCountryViewModelToController()
        }
    }
    
    var bindCountryViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.networkManager = NetworkManager()
        self.filteredTableData = [WorldData]()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.networkManager.getCountries { [weak self] data in
            switch data {
            case .failure(let error):
                print(error)
            case .success(let countries):
                self!.countryData = countries
                self!.filteredTableData = countries
            }
        }
    }
    
    func search(text: String, completion: @escaping() -> Void) {
        filteredTableData.removeAll()
        filteredTableData = text.isEmpty ? countryData : countryData.filter { $0.name.contains(text) }
    }
}
