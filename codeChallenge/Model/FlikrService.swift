//
//  FlikrService.swift
//  codeChallenge
//
//  Created by Omar Gomez on 8/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

import Foundation
//import UIKit

enum FlikrServiceError: Error {
    case invalidUrl
    case serializationError
}

@objc protocol FlikrService: class {
    
    func search(count: Int, onResult: @escaping (Error?, [Photo]?) -> ())
    func loadImage(url: String, onResult: @escaping (Error?, Data?) -> ())
    func getInfo(photoId: String, onResult: @escaping (Error?, PhotoDetail?) -> ())
    func loadImage(photoId: String, secret: String, server: String, onResult: @escaping (Error?, Data?) -> ())

}

@objc class FlikrServiceImpl: NSObject, FlikrService {

    var httpHandler: HTTPHandler
    let apiKey = "2ed35a9f4fda03bc96e73dbd03602780"
    
    @objc init(handler: HTTPHandler) {
        self.httpHandler = handler
    }
    
    func search(count: Int, onResult: @escaping (Error?, [Photo]?) -> ()) {
        
        guard let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(self.apiKey)&tags=cooking&per_page=\(count)&format=json&nojsoncallback=1&extras=date_taken,description,tags,url_t") else {
            onResult(FlikrServiceError.invalidUrl,nil)
            return
        }

        self.httpHandler.loadData(url: url) { data, response, error in
            guard let data = data,
                let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any],
                let photos = json["photos"] as? [String:Any],
                let photo = photos["photo"] as? [[String:Any]]
                else {
                    onResult(error, nil)
                    return
            }
            
            let result: [Photo] = photo.compactMap{ Photo(dictionary: $0) }
            
            onResult(nil,result)
        }

    }

    
    public func loadImage(url: String, onResult: @escaping (Error?, Data?) -> ()) {
        
        guard let imageUrl = URL(string: url) else {
            onResult(FlikrServiceError.invalidUrl,nil)
            return
        }
        
        self.httpHandler.loadData(url: imageUrl) { data, response, error in
            guard let data = data else {
                onResult(error, nil)
                return
            }
            
            onResult(nil,data)
        }

    }

    func getInfo(photoId: String, onResult: @escaping (Error?, PhotoDetail?) -> ()) {
        
        guard let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=\(self.apiKey)&photo_id=\(photoId)&format=json&nojsoncallback=1") else {
            onResult(FlikrServiceError.invalidUrl,nil)
            return
        }
        
        self.httpHandler.loadData(url: url) { data, response, error in
            guard let data = data,
                let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any],
                let photoDict = json["photo"] as? [String:Any]
                else {
                    onResult(FlikrServiceError.serializationError, nil)
                    return
            }
            
            onResult(nil,PhotoDetail(dictionary: photoDict))
        }
        
    }

    func loadImage(photoId: String, secret: String, server: String, onResult: @escaping (Error?, Data?) -> ()) {
        let url = "https://live.staticflickr.com/\(server)/\(photoId)_\(secret).jpg"
        loadImage(url: url, onResult: onResult)
    }
}
