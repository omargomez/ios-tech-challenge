//
//  PhotoDetailController.h
//  codeChallenge
//
//  Created by Omar Gomez on 9/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoDetailPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@class Photo;

@interface PhotoDetailController : UIViewController <UITableViewDelegate, UITableViewDataSource, PhotoDetailView>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong) Photo *selectedPhoto;

@end

NS_ASSUME_NONNULL_END
