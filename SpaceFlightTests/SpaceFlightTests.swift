//
//  SpaceFlightTests.swift
//  SpaceFlightTests
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 27/07/22.
//

import XCTest
@testable import SpaceFlight

class SpaceFlightTests: XCTestCase {

    var networkManager = NetworkManager()
    
    func testArticlesRead() throws {
        
        apiCall(start: 1, urlPath: K.url.pathArticles)
        XCTAssertEqual(networkManager.fieldsArticles.count, K.regsPerPage, "One page read")
        
        apiCall(start: 8, urlPath: K.url.pathArticles)
        XCTAssertEqual(networkManager.fieldsArticles.count, K.regsPerPage*2, "Two pages read")
    }
   
    func testBlogsRead() throws {
        
        apiCall(start: 1, urlPath: K.url.pathBlogs)
        XCTAssertEqual(networkManager.fieldsBlogs.count, K.regsPerPage, "One page read")
        
        apiCall(start: 8, urlPath: K.url.pathBlogs)
        XCTAssertEqual(networkManager.fieldsBlogs.count, K.regsPerPage*2, "Two pages read")
    }
    
    func testNasaReportsRead() throws {
        
        apiCall(start: 1, urlPath: K.url.pathNasaReports)
        XCTAssertEqual(networkManager.fieldsNasaReports.count, K.regsPerPage, "One page read")
        
        apiCall(start: 8, urlPath: K.url.pathNasaReports)
        XCTAssertEqual(networkManager.fieldsNasaReports.count, K.regsPerPage*2, "Two pages read")
    }
    
    func apiCall(start: Int, urlPath: String){
        networkManager.fetchData(start: start, urlPath: urlPath)
        _ = XCTWaiter.wait(for: [XCTestExpectation(description: urlPath)], timeout: 5.0)
    }
    
}
       
      
