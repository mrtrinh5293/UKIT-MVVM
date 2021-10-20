//
//  testSearch.swift
//  praticeUIKITxxTests
//
//  Created by duc on 2021-10-18.
//

import XCTest
@testable import praticeUIKITxx

class testSearch: XCTestCase {

    var sut: NetworkManager!
    var vm = CountryVM()
    
    let url = URL(string: "https://restcountries.eu/rest/v2/all")
    var urlSession: URLSession!
    
    override func setUpWithError() throws {
        // Set url session for mock networking
        sut = NetworkManager()
    }
    override func tearDown() {
        sut = nil
    }
    
    func testCheckAvaiableApi() {
        let expectation = XCTestExpectation(description: "Fetch API")
        let dataTask = URLSession.shared.dataTask(with: url!) { data, _, _ in
            XCTAssertNotNil(data, "No data being fetched")
            expectation.fulfill()
        }
        dataTask.resume()
    }

}
