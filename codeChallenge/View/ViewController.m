//
//  ViewController.m
//  codeChallenge
//
//  Created by Nano Suarez on 18/04/2018.
//  Copyright © 2018 Fernando Suárez. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "HomePresenter.h"
#import "Photo.h"
#import "HomeCellPresenter.h"
#import "PhotoDetailController.h"

NSString *const FlickrAPIKey = @"2ed35a9f4fda03bc96e73dbd03602780";

@interface ViewController ()

@property (strong, nonatomic) id<HomePresenter> presenter;
@property (strong, nonatomic) NSArray<Photo *> *photoArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photoArray = @[];
    self.presenter = [[HomePresenterImpl alloc] initWithView: self
                      andService:[[FlikrServiceImpl alloc] initWithHandler:[[URLSessionHTTPHandler alloc] init]]];
    [self.presenter onLoad];
    
    UINib *cellNib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"CustomCell"];
}

- (void)viewWillAppear:(BOOL)animated {
    
}

//TableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.photoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"CustomCell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell.presenter == nil) {
        cell.presenter = [[HomeCellPresenterImpl alloc] initWithView:cell andFlikrService: [[FlikrServiceImpl alloc] initWithHandler:[[URLSessionHTTPHandler alloc] init]] ];
    }
    
    Photo *item = [self.photoArray objectAtIndex:indexPath.row];
    [cell.presenter reloadPhotoItem:item];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Photo *selectedPhoto = [self.photoArray objectAtIndex:indexPath.row];
    
    // Open the detail screen form this item
//    PhotoDetailID
    PhotoDetailController *cont = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoDetailID"];
    cont.selectedPhoto = selectedPhoto;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showViewController:cont sender:nil];
    });
    
}

#pragma mark - HomeView

-(void) showAlert: (NSString *) msg
{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Error"
                                 message:msg
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * ok = [UIAlertAction
                          actionWithTitle:@"OK"
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action)
                          { }];
    
     [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) setData: (NSArray<Photo *> *) photoArr
{
    self.photoArray = photoArr;
    [self.tableView reloadData];
}


@end
