//
//  MockHomeView.swift
//  codeChallengeTests
//
//  Created by Omar Gomez on 9/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

import Foundation
import XCTest
@testable import codeChallenge

class MockHomeView: NSObject, HomeView {
    
    var showAlertCalled: Bool = false
    var setDataCalled: Bool = false
    let expectation = XCTestExpectation(description: "view expectation")
    
    func showAlert(_ msg: String) {
        showAlertCalled = true
        expectation.fulfill()
    }
    
    func setData(_ photoArr: [Photo]) {
        setDataCalled = true
        expectation.fulfill()
    }
    
}
