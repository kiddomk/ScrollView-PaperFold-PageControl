//
//  DetailViewController.h
//  ScrollView+PaperFold+PageControl
//
//  Created by Jun Seki on 13/06/2014.
//  Copyright (c) 2014 Poq Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaperFoldView.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate,PaperFoldViewDelegate>

@property (strong, nonatomic) id detailItem;

@property (nonatomic, strong) IBOutlet PaperFoldView *paperFoldView;
@property (nonatomic, strong) UIView *topView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
