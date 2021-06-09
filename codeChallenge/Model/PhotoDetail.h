//
//  PhotoDetail.h
//  codeChallenge
//
//  Created by Omar Gomez on 9/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoDetail : NSObject

@property (strong) NSString *photoId;
@property (strong) NSString *secret;
@property (strong) NSString *server;
@property (strong) NSString *title;
@property (strong) NSString *owner;
@property (strong) NSString *photoDescription;

-(id) initWithDictionary: (NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
