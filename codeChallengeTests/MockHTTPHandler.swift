//
//  MockHTTPHandler.swift
//  codeChallengeTests
//
//  Created by Omar Gomez on 9/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

import Foundation
@testable import codeChallenge

enum MockHTTPHandlerError: Error {
    case dataError
    case patternError
}

class MockHTTPHandler: HTTPHandler {

    var patternResourceDict: [String: URL] = [:]
    
    func loadData(url: URL, onResult: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        DispatchQueue.global(qos: .default).async {
            let strUrl = url.absoluteString
            
            for (key, value) in self.patternResourceDict {
                if strUrl.contains(key) {
                    guard let data = try? Data(contentsOf: value) else {
                        onResult(nil, nil, MockHTTPHandlerError.dataError)
                        return
                    }
                    onResult(data, nil, nil)
                    return
                }
            }
            
            onResult(nil, nil, MockHTTPHandlerError.patternError)
        }
    }
    
    func addMapping(pattern: String, resource: URL) {
        self.patternResourceDict[pattern] = resource
    }
    
}

