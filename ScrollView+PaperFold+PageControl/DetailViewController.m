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


- (void)awakeFromNib
{
    //set up data
    //your swipeView should always be driven by an array of
    //data of some kind - don't store data in your item views
    //or the recycling mechanism will destroy your data once
    //your item views move off-screen
    self.items = [[NSMutableArray alloc]initWithCapacity:12];
    [self.items addObject:[UIImage imageNamed:@"Browser.png"]];
    [self.items addObject:[UIImage imageNamed:@"Calculator.png"]];
    [self.items addObject:[UIImage imageNamed:@"Calendar.png"]];
    [self.items addObject:[UIImage imageNamed:@"Chat.png"]];
    [self.items addObject:[UIImage imageNamed:@"Clock.png"]];
    [self.items addObject:[UIImage imageNamed:@"Graph.png"]];
    [self.items addObject:[UIImage imageNamed:@"iPod.png"]];
    [self.items addObject:[UIImage imageNamed:@"Maps.png"]];
    [self.items addObject:[UIImage imageNamed:@"Notes.png"]];
    [self.items addObject:[UIImage imageNamed:@"Phone.png"]];
    [self.items addObject:[UIImage imageNamed:@"Settings.png"]];
    [self.items addObject:[UIImage imageNamed:@"Weather.png"]];
    
}



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
    
    
    
    _paperFoldView = [[PaperFoldView alloc] initWithFrame:CGRectMake(0,64,[self.view bounds].size.width,[self.view bounds].size.height)];
    [_paperFoldView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [self.view addSubview:_paperFoldView];
    [_paperFoldView setDelegate:self];
    [_paperFoldView setCenterContentView:_scrollView];
    
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0,0,[self.view bounds].size.width,80)];
    [_topView setBackgroundColor:[UIColor whiteColor]];
        [_topView addSubview:_swipeView];
    
    
    [_paperFoldView setTopFoldContentView:_topView topViewFoldCount:2 topViewPullFactor:0.9];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    _swipeView.pagingEnabled = YES;
    _swipeView.alignment = SwipeViewAlignmentCenter;
    _swipeView.itemsPerPage = 1;
    _swipeView.truncateFinalPage = YES;
}
-(void)viewDidLayoutSubviews{
    //[_scrollView setContentSize:CGSizeMake(320, 500)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    //return the total number of items in the carousel
    return [_items count];
}


- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{

    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        
    view = [[NSBundle mainBundle] loadNibNamed:@"ItemView" owner:self options:nil][0];

    }
    NSLog(@"index :%ld",(long)index);
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:view.bounds];
    imageView.image=[self.items objectAtIndex:index];
    imageView.contentMode=UIViewContentModeScaleAspectFit;
    [view addSubview:imageView];
    
    return view;
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
