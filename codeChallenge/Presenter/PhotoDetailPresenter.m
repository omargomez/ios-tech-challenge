//
//  PhotoDetailPresenter.m
//  codeChallenge
//
//  Created by Omar Gomez on 9/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import "PhotoDetailPresenter.h"
#import "Photo.h"

@interface PhotoDetailPresenterImpl()

@property (weak) id<PhotoDetailView> view;
@property (strong) Photo *selected;
@property (strong) id<FlikrService> service;

@end


@implementation PhotoDetailPresenterImpl

-(id) initWithPhoto: (Photo *) photo service:(id<FlikrService>) service andView: (id<PhotoDetailView>) view;
{
    if (self = [super init]) {
        self.view = view;
        self.selected = photo;
        self.service = service;
    }
    
    return self;
}

-(void) onLoad {
    
    // Will try to load the detail for this item
    [self.service getInfoWithPhotoId:self.selected.photoId onResult:^(NSError *error, PhotoDetail *detail){

        // TODO: Error handling (presenters)
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view setData: detail];
        });
        
        [self.service loadImageWithPhotoId:detail.photoId secret:detail.secret server:detail.server onResult:^(NSError *error, NSData *data){
            
            //TODO: Error check
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.view setImage: data];
            });
        }];
        
    }];
    
}

@end
