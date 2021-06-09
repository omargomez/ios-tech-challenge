//
//  PhotoDetailPresenter.h
//  codeChallenge
//
//  Created by Omar Gomez on 9/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "codeChallenge-Swift.h"
#import "PhotoDetail.h"

NS_ASSUME_NONNULL_BEGIN

@class Photo;

@protocol PhotoDetailPresenter <NSObject>

-(void) onLoad;

@end

@protocol PhotoDetailView <NSObject>

-(void) setData: (PhotoDetail *) data;
-(void) setImage: (NSData *) data;
-(void) showAlert: (NSString *) msg;

@end

@interface PhotoDetailPresenterImpl : NSObject <PhotoDetailPresenter>

-(id) initWithPhoto: (Photo *) photo service:(id<FlikrService>) service andView: (id<PhotoDetailView>) view;
@end

NS_ASSUME_NONNULL_END
