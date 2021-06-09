//
//  HomeCellPresenter.h
//  codeChallenge
//
//  Created by Omar Gomez on 8/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

@import UIKit;
#import <Foundation/Foundation.h>
#import "codeChallenge-Swift.h"


NS_ASSUME_NONNULL_BEGIN

@class Photo;

@protocol HomeCellView <NSObject>

-(void) setTitle: (NSString *) aTitle;
-(void) setSubtitle: (NSString *) aSubtitle;
-(void) setImageWithData: (NSData *) data;
-(void) setImage: (UIImage *) image;

@end

@protocol HomeCellPresenter <NSObject>

-(void) reloadPhotoItem: (Photo *) item;

@end

@interface HomeCellPresenterImpl : NSObject <HomeCellPresenter>

-(id) initWithView: (id<HomeCellView>) aView andFlikrService: (id<FlikrService>) service;

@end

NS_ASSUME_NONNULL_END
