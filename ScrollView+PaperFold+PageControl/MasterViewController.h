//
//  MasterViewController.h
//  ScrollView+PaperFold+PageControl
//
//  Created by Jun Seki on 13/06/2014.
//  Copyright (c) 2014 Poq Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
