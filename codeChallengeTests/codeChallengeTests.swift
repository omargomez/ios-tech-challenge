//
//  codeChallengeTests.swift
//  codeChallengeTests
//
//  Created by Omar Gomez on 9/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

import XCTest
@testable import codeChallenge

class codeChallengeTests: XCTestCase {

    var testSubject: FlikrService!
    lazy var testHandler: HTTPHandler = {
        var handler = MockHTTPHandler()
        let testBundle = Bundle(for: type(of: self))
        
        if let path = testBundle.path(forResource: "flickr-photos-search", ofType: "json") {
            handler.addMapping(pattern: "flickr.photos.search", resource: URL(fileURLWithPath: path))
        }
        if let pathImage = testBundle.path(forResource: "demo-image", ofType: "jpg") {
            handler.addMapping(pattern: "staticflickr", resource: URL(fileURLWithPath: pathImage))
        }
        if let infoPath = testBundle.path(forResource: "get-info", ofType: "json") {
            handler.addMapping(pattern: "flickr.photos.getInfo", resource: URL(fileURLWithPath: infoPath))
        }
        return handler
    }()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testSubject = FlikrServiceImpl(handler: testHandler)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearch() {

        let searchExp = expectation(description: "search")
        
        testSubject.search(count: 15, onResult: { error, photos in
            XCTAssertNotNil(photos, "Photos shuldn't be nil")
            searchExp.fulfill()
        })
        
        waitForExpectations(timeout: 30, handler: nil)
        
    }
    
    func testLoadImage() {
        
        let laodExp = expectation(description: "loadImage")
        
        testSubject.loadImage(url: "https://live.staticflickr.com/65535/51235118169_724814916f_t.jpg") { error, data in
            XCTAssertNotNil(data, "Image shuldn't be nil")
            
            if let data = data,
                let image = UIImage(data: data) {
                
                XCTAssert(image.size.height > 0, "Image should have a size")
            } else {
                XCTFail()
            }
            
            laodExp.fulfill()
        }
        
        waitForExpectations(timeout: 30, handler: nil)

    }

    func testLoadImageInvalidURL() {
        let loadExp = expectation(description: "loadImage")
        
        testSubject.loadImage(url: "") { error, data in
            XCTAssertNotNil(error, "Error shuldn't be nil")
            loadExp.fulfill()
        }
        
        waitForExpectations(timeout: 30, handler: nil)

    }
    
    func testGetInfo() {
        let infoExp = expectation(description: "loadImage")
        
        testSubject.getInfo(photoId: "51234338681") { error, data in
            XCTAssertNotNil(data, "Data shuldn't be nil")
            infoExp.fulfill()
        }

        waitForExpectations(timeout: 30, handler: nil)
    }
        

}
