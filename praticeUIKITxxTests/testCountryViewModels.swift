//
//  testCountryViewModels.swift
//  praticeUIKITxxTests
//
//  Created by duc on 2021-10-21.
//

import XCTest
@testable import praticeUIKITxx

class testCountryViewModels: XCTestCase {
    
    var networkManager: NetworkManager!
    var sut: CountryViewModel!
    var filteredTableData: [WorldData]!
    
    override func setUpWithError() throws {
        sut = CountryViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
//    func testSearchText_WhenGivenInvalidData_ReturnNil() {
//        
//        let expectation = expectation(description: "Country List return VietNam")
//        
//        filteredTableData.removeAll()
//        let expectedTargetSearchText = filteredTableData.filter { $0.name.contains("VietNam") }
//        
//        sut.searchController.searchBar.text = "VietNam"
//        
//        XCTAssertEqual(expectation, "VietNam")
//    }
}
