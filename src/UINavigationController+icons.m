#import "UINavigationController+icons.h"


@implementation UINavigationController (BCTabBarController)

- (NSString *)iconImageName {
	return [[self.viewControllers objectAtIndex:0] iconImageName];
}

- (NSString *)selectedIconImageNameSuffix {
	return [[self.viewControllers objectAtIndex:0] selectedIconImageNameSuffix];
}

- (NSString *)landscapeIconImageNameSuffix {
	return [[self.viewControllers objectAtIndex:0] landscapeIconImageNameSuffix];
}

@end
