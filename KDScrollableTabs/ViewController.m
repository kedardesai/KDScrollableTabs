//
//  ViewController.m
//  KDScrollableTabs
//
//  Created by Kedar Desai on 13/02/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "ViewController.h"

#define TAB_WIDTH 150
#define TAB_HEIGHT 40

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *tabsDataArray;

@end

@implementation ViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tabsDataArray = [[NSMutableArray alloc] initWithObjects:@"Tab 1", @"Tab 2", @"Tab 3", @"Tab 4", @"Tab 5", @"Tab 6", nil];
    
    self.scrollableTabView.delegate = self;
    self.scrollableTabView.datasource = self;
    [self.scrollableTabView loadView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark KDScrollableTabsDatasource Methods

- (NSInteger)numberOfTabs
{
    return [self.tabsDataArray count];
}

- (UIView *)viewForTabAtIndexPath:(NSInteger)indexPath
{
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TAB_WIDTH, TAB_HEIGHT)];
    
    UILabel *tabName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, TAB_WIDTH, TAB_HEIGHT-2)];
    [tabName setTextAlignment:NSTextAlignmentCenter];
    tabName.center = mainView.center;
    [tabName setText:[self.tabsDataArray objectAtIndex:indexPath]];
    [mainView addSubview:tabName];
    
    return mainView;
}

- (CGFloat)widthForTabAtIndexPath:(NSInteger)indexPath
{
    return TAB_WIDTH;
}


#pragma mark KDScrollableTabsDelegate Methods

- (void)didSelectTabAtIndexPath:(NSInteger)indexPath forView:(UIView *)view
{
    NSLog(@"indexPath :: %ld", (long)indexPath);
}

@end
