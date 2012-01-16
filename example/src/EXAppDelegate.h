@class BCTabBarController;

@interface EXAppDelegate : NSObject <UIApplicationDelegate> {
	BCTabBarController *tabBarController;
	UIWindow *window;
}

@property (nonatomic, strong) BCTabBarController *tabBarController;
@property (nonatomic, strong) UIWindow *window;
@end
