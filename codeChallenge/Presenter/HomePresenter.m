//
//  HomePresenter.m
//  codeChallenge
//
//  Created by Omar Gomez on 8/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import "HomePresenter.h"
#import "codeChallenge-Swift.h"

@interface HomePresenterImpl () {
}

@property (nonatomic, strong) id<FlikrService> flikrService;
@property (nonatomic, weak) id<HomeView> view;

@end

@implementation HomePresenterImpl

-(id) init
{
    if (self = [super init]) {
        self.flikrService = [[FlikrServiceImpl alloc] initWithHandler:[[URLSessionHTTPHandler alloc] init] ];
    }
    
    return self;
}

-(id) initWithView: (id<HomeView>) aView
{
    if (self = [super init]) {
        self.flikrService = [[FlikrServiceImpl alloc] initWithHandler:[[URLSessionHTTPHandler alloc] init]]; //TODO
        self.view = aView;
    }
    
    return self;
}

-(void) onLoad
{
    // Load data
    [self.flikrService searchWithCount:12 onResult:^ (NSError *error, NSArray<Photo *> *photos){
        
        dispatch_async(dispatch_get_main_queue(), ^{

            if (error != nil) {
                [self.view showAlert:error.localizedDescription];
            } else {
                NSLog(@"Photos: %@", photos);
                [self.view setData:photos];
            }
            
        });
        
    } ];
}


@end
