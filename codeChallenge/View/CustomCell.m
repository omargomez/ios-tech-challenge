//
//  CustomCell.m
//  codeChallenge
//
//  Created by Nano Suarez on 18/04/2018.
//  Copyright © 2018 Fernando Suárez. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    [self.presenter prepareForReuse];
}

-(void) setTitle: (NSString *) aTitle
{
    self.imageTitleCell.text = aTitle;
}

-(void) setSubtitle: (NSString *) aSubtitle
{
    self.imageSubtitleCell.text = aSubtitle;
}

-(void) setImageWithData: (NSData *) data
{
    self.imageCell.image = [[UIImage alloc] initWithData:data];
}

-(void) setImage: (UIImage *) image {
    self.imageCell.image = image;
}
@end
