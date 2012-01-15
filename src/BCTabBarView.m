#import "BCTabBarView.h"
#import "BCTabBar.h"

@implementation BCTabBarView
@synthesize tabBar, contentView;

- (void)setTabBar:(BCTabBar *)aTabBar {
    if (tabBar != aTabBar) {
        [tabBar removeFromSuperview];
        tabBar = aTabBar;
        [self addSubview:tabBar];
    }
}

- (void)setContentView:(UIView *)aContentView {
	[contentView removeFromSuperview];
	contentView = aContentView;
	contentView.frame = CGRectMake(0, 0, self.bounds.size.width, self.tabBar.frame.origin.y);

	[self addSubview:contentView];
	[self sendSubviewToBack:contentView];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	CGRect f = contentView.frame;
    if (self.tabBar.isInvisible) {
        f.size.height = self.bounds.size.height;
    } else {
        f.size.height = self.bounds.size.height - self.tabBar.bounds.size.height;
    }
	contentView.frame = f;
	//[contentView layoutSubviews]; // this method should not be called directly!
    [contentView setNeedsLayout];
}

- (void)drawRect:(CGRect)rect {
	CGContextRef c = UIGraphicsGetCurrentContext();
	[[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0] set];
	CGContextFillRect(c, self.bounds);
}

@end
