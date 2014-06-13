//
//  DetailViewController.m
//  ScrollView+PaperFold+PageControl
//
//  Created by Jun Seki on 13/06/2014.
//  Copyright (c) 2014 Poq Studio. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    //_paperFoldView = [[PaperFoldView alloc] initWithFrame:CGRectMake(0,64,[self.view bounds].size.width,[self.view bounds].size.height)];
    [_paperFoldView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    //[self.view addSubview:_paperFoldView];
    [_paperFoldView setDelegate:self];
    //[_paperFoldView setCenterContentView:_scrollView];
    
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0,0,[self.view bounds].size.width,300)];
    [_topView setBackgroundColor:[UIColor whiteColor]];
    UILabel *topLabel = [[UILabel alloc] initWithFrame:_topView.frame];
    [topLabel setText:@"A"];
    [topLabel setBackgroundColor:[UIColor clearColor]];
    [topLabel setFont:[UIFont boldSystemFontOfSize:300]];
    [topLabel setTextAlignment:NSTextAlignmentCenter];
    [_topView addSubview:topLabel];
    
    
    [_paperFoldView setTopFoldContentView:_topView topViewFoldCount:2 topViewPullFactor:0.9];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}
-(void)viewDidLayoutSubviews{
    //[_scrollView setContentSize:CGSizeMake(320, 500)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
