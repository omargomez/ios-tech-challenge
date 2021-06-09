//
//  HTTPHandler.swift
//  codeChallenge
//
//  Created by Omar Gomez on 9/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

import Foundation

@objc protocol HTTPHandler: class {
    func loadData(url: URL, onResult: @escaping (Data?, URLResponse?, Error?) -> ());
}

@objc class URLSessionHTTPHandler: NSObject, HTTPHandler {
    
    func loadData(url: URL, onResult: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            onResult(data, response, error)
            
        })
        task.resume()
    }
}
