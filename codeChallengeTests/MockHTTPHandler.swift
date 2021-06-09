//
//  MockHTTPHandler.swift
//  codeChallengeTests
//
//  Created by Omar Gomez on 9/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

import Foundation
@testable import codeChallenge

class MockHTTPHandler: HTTPHandler {

    var patternResourceDict: [String: URL] = [:]
    
    func loadData(url: URL, onResult: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        DispatchQueue.global(qos: .default).async {
            let strUrl = url.absoluteString
            
            for (key, value) in self.patternResourceDict {
                if strUrl.contains(key) {
                    guard let data = try? Data(contentsOf: value) else {
                        onResult(nil, nil, nil) //TODO
                        return // error
                    }
                    onResult(data, nil, nil)
                    return
                }
            }
            
            onResult(nil, nil, nil) // Error
        }
    }
    
    func addMapping(pattern: String, resource: URL) {
        self.patternResourceDict[pattern] = resource
    }
    
}

