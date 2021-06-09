//
//  Photo.h
//  codeChallenge
//
//  Created by Omar Gomez on 8/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSObject

@property (strong) NSString *photoId;
@property (strong) NSString *title;
@property (strong) NSString *longDescription;
@property (strong) NSString *dateTaken;
@property (strong) NSString *imageUrl;

-(id) initWithDictionary: (NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
