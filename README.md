# KDScrollableTabs
KDScrollableTabs allows to create tabs that can be scrolled.

## How To Use
1. Just import classes KDScrollableTabs.h and KDScrollableTabs.m into your project.
2. Drag a UIView in storyboard/xib.
3. Change class of view taken in step 2 to 'KDScrollableTabs' in 'Identity Inspector'
4. Import KDScrollableTabs.h in your UIViewController's .h file.
5. Implement KDScrollableTabsDatasource, KDScrollableTabsDelegate in UIViewController's .h file.
6. Implement Following Methods of KDScrollableTabsDatasource
    - (NSInteger)numberOfTabs // Return the number of tabs you want.
    - (UIView *)viewForTabAtIndexPath:(NSInteger)indexPath // To design view of tab. Create a new view, design it and return it.
    - (CGFloat)widthForTabAtIndexPath:(NSInteger)indexPath // Return TAB_WIDTH;
    
7. Implement Following Methods of KDScrollableTabsDelegate
    - (void)didSelectTabAtIndexPath:(NSInteger)indexPath forView:(UIView *)view // Take action as per your requirement

## License

You have full rights to change existing code as per your requirement.
