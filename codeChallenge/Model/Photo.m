//
//  Photo.m
//  codeChallenge
//
//  Created by Omar Gomez on 8/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(id) init {
    if (self = [super init]) {
        self.photoId = self.imageUrl = self.dateTaken = self.longDescription = @"";
    }
    
    return self;
}

-(id) initWithDictionary: (NSDictionary *) dict {
    if (self = [super init]) {
        self.photoId = [dict objectForKey:@"id"];
        self.title = [dict objectForKey:@"title"];
        self.imageUrl = [dict objectForKey:@"url_t"];
        self.dateTaken = [dict objectForKey:@"datetaken"];
        self.longDescription = [[dict objectForKey:@"description"] objectForKey:@"_content"];
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"ID: %@, %@", self.photoId, self.title];
}

@end
