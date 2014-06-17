//
//  DetailViewController.h
//  ScrollView+PaperFold+PageControl
//
//  Created by Jun Seki on 13/06/2014.
//  Copyright (c) 2014 Poq Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaperFoldView.h"
#import "SwipeView.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate,PaperFoldViewDelegate,SwipeViewDataSource, SwipeViewDelegate>

@property (strong, nonatomic) id detailItem;

@property (nonatomic, strong) IBOutlet PaperFoldView *paperFoldView;
@property (nonatomic, strong) UIView *topView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (nonatomic, strong) IBOutlet SwipeView *swipeView;
@property (nonatomic, strong) NSMutableArray *items;

@end
