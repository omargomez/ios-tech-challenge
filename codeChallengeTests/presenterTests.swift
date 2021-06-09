//
//  presenterTests.swift
//  codeChallengeTests
//
//  Created by Omar Gomez on 9/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

import XCTest
@testable import codeChallenge

class presenterTests: XCTestCase {

    var testSubject: HomePresenter!
    var testView: MockHomeView!
    var testService: FlikrService!
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
        self.testView = MockHomeView()
        self.testService = FlikrServiceImpl(handler: self.testHandler)
        self.testSubject = HomePresenterImpl(view: self.testView, andService: self.testService)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {

        testSubject.onLoad()

        wait(for: [testView.expectation], timeout: 30)
        
        XCTAssert(testView.setDataCalled, "Set data should be called");
    }

}
