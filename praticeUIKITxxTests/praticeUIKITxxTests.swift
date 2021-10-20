//
//  praticeUIKITxxTests.swift
//  praticeUIKITxxTests
//
//  Created by duc on 2021-10-16.
//

import XCTest
@testable import praticeUIKITxx

class praticeUIKITxxTests: XCTestCase {
    
    var sut: CountriesViewController!
    
    override func setUp() {
        
        super.setUp()
        
        //get the storyboard the ViewController under test is inside
        guard let controller = UIStoryboard(name: "Main", bundle: Bundle(for: CountriesViewController.self)).instantiateViewController(withIdentifier: "CountriesViewController") as? CountriesViewController
        else {
            return XCTFail("Failed to instantiate CountriesViewController from storyboard")
        }
        //get the ViewController we want to test from the storyboard (note the identifier is the id explicitly set in the identity inspector)
        sut = controller
        
        //load view hierarchy
        _ = sut.view
    }
    
    override func tearDown() {
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func hasSegueWithIdentifier(id: String) -> Bool {
        
        let segues = sut.value(forKey: "storyboardSegueTemplates") as? [NSObject]
        let filtered = segues?.filter({ $0.value(forKey: "identifier") as? String == id })
        
        return (filtered?.count ?? 0 > 0) ?? false
    }
    
    func testSUT_HasSegue_ForTransitioningTo_ViewConrollerOne() {
        
        
        XCTAssertTrue(hasSegueWithIdentifier(id: "ShowDetailSegue"), "Segue ShowDetailViewController should exist.")
        
    }
}
