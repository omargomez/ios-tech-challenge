//
//  PhotoDetail.m
//  codeChallenge
//
//  Created by Omar Gomez on 9/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import "PhotoDetail.h"

@implementation PhotoDetail

-(id) initWithDictionary: (NSDictionary *) dict {
    
    if (self = [super init]) {
        NSString *val;
        self.photoId = [dict objectForKey:@"id"];
        self.server = [dict objectForKey:@"server"];
        self.secret = [dict objectForKey:@"secret"];
        self.title = self.owner = self.photoDescription = @"<No content>";
        if ((val = [[dict objectForKey:@"title"] objectForKey:@"_content"]) ) {
            self.title = val;
        }
        if ((val = [[dict objectForKey:@"owner"] objectForKey:@"username"]) ) {
            self.owner = val;
        }
        if ((val = [[dict objectForKey:@"description"] objectForKey:@"_content"]) ) {
            self.photoDescription = val;
        }
    }
    
    return self;
}

@end
