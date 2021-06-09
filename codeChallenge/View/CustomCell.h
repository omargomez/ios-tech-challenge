//
//  CustomCell.h
//  codeChallenge
//
//  Created by Nano Suarez on 18/04/2018.
//  Copyright © 2018 Fernando Suárez. All rights reserved.
//

@import UIKit;
#import "HomeCellPresenter.h"

@interface CustomCell : UITableViewCell <HomeCellView>
@property (weak, nonatomic) IBOutlet UIImageView *imageCell;
@property (weak, nonatomic) IBOutlet UILabel *imageTitleCell;
@property (weak, nonatomic) IBOutlet UILabel *imageSubtitleCell;
@property (strong, nonatomic) id<HomeCellPresenter> presenter;

@end
