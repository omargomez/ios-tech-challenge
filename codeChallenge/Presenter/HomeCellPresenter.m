//
//  HomeCellPresenter.m
//  codeChallenge
//
//  Created by Omar Gomez on 8/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import "HomeCellPresenter.h"
#import "Photo.h"


@interface HomeCellPresenterImpl ()

@property (weak) id<HomeCellView> view;
@property (strong) id<FlikrService> flikrService;

@end

@implementation HomeCellPresenterImpl

-(id) initWithView: (id<HomeCellView>) aView andFlikrService: (id<FlikrService>) service
{
    if (self = [super init]) {
        self.view = aView;
        self.flikrService = service;
    }

    return self;
}

-(void) reloadPhotoItem: (Photo *) item
{
    [self.view setTitle: item.title];
    [self.view setSubtitle: item.longDescription];
    
    // La buena es la carga de la imagen
    
    [self.view setImage: [UIImage imageNamed:@"defaultPhoto"]];
    [self.flikrService loadImageWithUrl:item.imageUrl onResult:^(NSError* error, NSData* data) {
        
        //TODO: IS loading the same as before???
        if (error != NULL) {
            NSLog(@"Error while loading image: %@", error.localizedDescription);
            return;
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.view setImage: [[UIImage alloc] initWithData:data]];
            });
        }
        
    }];
    
}

@end
