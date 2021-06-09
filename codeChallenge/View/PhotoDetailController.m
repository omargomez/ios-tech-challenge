//
//  PhotoDetailController.m
//  codeChallenge
//
//  Created by Omar Gomez on 9/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import "PhotoDetailController.h"
#import "PhotoDetail.h"
#import "PhotoDetailCell.h"
#import "DetailImageCell.h"

@interface PhotoDetailController ()

@property (strong) id<PhotoDetailPresenter> presenter;
@property (strong) PhotoDetail *detail;
@property (strong) UIImage *detailImage;

@end

@implementation PhotoDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.presenter = [[PhotoDetailPresenterImpl alloc] initWithPhoto:self.selectedPhoto
                             service: [[FlikrServiceImpl alloc] initWithHandler:[[URLSessionHTTPHandler alloc] init]]
                             andView:self];
    [self.presenter onLoad];
    
    self.tableView.estimatedRowHeight = 132.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

}

- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 ) {
        DetailImageCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DetailImageCellID"];

        if (self.detailImage) {
            cell.detailImage.image = self.detailImage;
        } 
        
        return cell;

    } else {
        PhotoDetailCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DetailCellID"];
        
        switch (indexPath.row) {
            case 1:
                cell.titleLabel.text = @"ID";
                cell.detailLabel.text = self.detail.photoId;
                break;
            case 2:
                cell.titleLabel.text = @"Title";
                cell.detailLabel.text = self.detail.title;
                break;
            case 3:
                cell.titleLabel.text = @"Owner";
                cell.detailLabel.text = self.detail.owner;
                break;
            case 4:
                cell.titleLabel.text = @"Description";
                cell.detailLabel.text = self.detail.photoDescription;
                break;
                
        }
        
        return cell;

    }
    
    
}

#pragma mark - PhotoDetailView

-(void) setData: (PhotoDetail *) data
{
    self.detail = data;
    [self.tableView reloadData];
}

-(void) setImage: (NSData *) data
{
    self.detailImage = [UIImage imageWithData:data];
    [self.tableView reloadData];
}

@end
