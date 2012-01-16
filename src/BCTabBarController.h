#import "BCTabBar.h"

@class BCTabBarView;

@interface BCTabBarController : UIViewController <BCTabBarDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) BCTabBar *tabBar;
@property (nonatomic, strong) UIViewController *selectedViewController;
@property (nonatomic, strong) BCTabBarView *tabBarView;
@property (nonatomic) NSUInteger selectedIndex;
@property (nonatomic, readonly) BOOL visible;

@end
