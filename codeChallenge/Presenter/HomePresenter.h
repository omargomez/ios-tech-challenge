//
//  HomePresenter.h
//  codeChallenge
//
//  Created by Omar Gomez on 8/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Photo;

@protocol HomePresenter <NSObject>

-(void) onLoad;

@end

@protocol HomeView <NSObject>

-(void) showAlert: (NSString *) msg;
-(void) setData: (NSArray<Photo *> *) photoArr;

@end

@interface HomePresenterImpl : NSObject <HomePresenter>

-(id) initWithView: (id<HomeView>) aView;

@end

NS_ASSUME_NONNULL_END
