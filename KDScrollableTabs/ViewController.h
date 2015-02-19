//
//  ViewController.h
//  KDScrollableTabs
//
//  Created by Kedar Desai on 13/02/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDScrollableTabs.h"

//@class KDScrollableTabs;

@interface ViewController : UIViewController <KDScrollableTabsDatasource, KDScrollableTabsDelegate>

@property (nonatomic, weak) IBOutlet KDScrollableTabs *scrollableTabView;

@end

