//
//  testSearch.swift
//  praticeUIKITxxTests
//
//  Created by duc on 2021-10-18.
//

import XCTest
@testable import praticeUIKITxx

class testNetworkManager: XCTestCase {
    
    var sut: NetworkManager!
    var vm = CountryViewModel()
    
    let url = URL(string: "https://restcountries.com/v2/all")
    var urlSession: URLSession!
    
    override func setUpWithError() throws {
        // Set url session for mock networking
        sut = NetworkManager()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: configuration)
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
    
    func testNetworkRequest() throws {
        
        let sampleCountryData = WorldData(name: "Vietnam", numericCode: "", alpha2Code: "", capital: "", region: "", population: 12, area: 12.2, altSpellings: ["VN"], timezones: ["GMT"], latlng: [12.2], currencies: [Currency.init(code: "String", name: "", symbol: "")], languages: [Language.init(name: "vn")], flag: "", callingCodes: [""])
        
        let mockData = try JSONEncoder().encode(sampleCountryData)
        
        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockData)
        }
        
        let expectation = expectation(description: "Completion handler invoked")

        self.sut.getCountries { [weak self] data in
            switch data {
            case .failure(let error):
                print(error)
            case .success(let countries):
                XCTAssertEqual(countries[0].name, "Afghanistan")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testNetworkData_WhenGivenValidData_ReturnSuccesss() {
        let expectation = expectation(description: "Afghanistan")
        self.sut.getCountries { [weak self] data in
            switch data {
            case .failure(let error):
                print(error)
            case .success(let countries):
                XCTAssertEqual(countries[0].name, "Afghanistan")
            }
        }
        expectation.fulfill()
        wait(for: [expectation], timeout: 5)
    }
}
