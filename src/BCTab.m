#import "BCTab.h"

@interface BCTab ()
@property (nonatomic, retain) UIImage *rightBorder;
@property (nonatomic, retain) UIImage *background;
@property (nonatomic, retain) NSString *imageName;
@property (nonatomic, retain) NSString *selectedImageNameSuffix;
@property (nonatomic, retain) NSString *landscapeImageNameSuffix;
@end

@implementation BCTab
@synthesize rightBorder, background, imageName, selectedImageNameSuffix, landscapeImageNameSuffix;

- (void)assignImages:(NSString *)_imageName selectedImageNameSuffix:(NSString *)_selectedSuffix {
    NSString *selctedImageName = [[[_imageName stringByDeletingPathExtension] stringByAppendingString:_selectedSuffix] stringByAppendingPathExtension:[_imageName pathExtension]];
    [self setImage:[UIImage imageNamed:_imageName] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:selctedImageName] forState:UIControlStateSelected];
}

- (id)initWithIconImageName:(NSString *)_imageName selectedImageNameSuffix:(NSString *)_selectedSuffix landscapeImageNameSuffix:(NSString *)_landscapeSuffi {
    if ((self = [super init])) {
		self.adjustsImageWhenHighlighted = NO;
		self.background = [UIImage imageNamed:@"BCTabBarController.bundle/tab-background.png"];
		self.rightBorder = [UIImage imageNamed:@"BCTabBarController.bundle/tab-right-border.png"];
		self.backgroundColor = [UIColor clearColor];
		
		[self assignImages:_imageName selectedImageNameSuffix:_selectedSuffix];
        self.imageName = _imageName;
        self.selectedImageNameSuffix = _selectedSuffix;
        self.landscapeImageNameSuffix = _landscapeSuffi;
	}
	return self;
}

- (void)dealloc {
	self.rightBorder = nil;
	self.background = nil;
    self.imageName = nil;
    self.selectedImageNameSuffix = nil;
    self.landscapeImageNameSuffix = nil;
	[super dealloc];
}

- (void)setHighlighted:(BOOL)aBool {
	// no highlight state
}

- (void)drawRect:(CGRect)rect {
	if (self.selected) {
		[background drawAtPoint:CGPointMake(0, 2)];
		[rightBorder drawAtPoint:CGPointMake(self.bounds.size.width - rightBorder.size.width, 2)];
		CGContextRef c = UIGraphicsGetCurrentContext();
		[[UIColor colorWithRed:24.0/255.0 green:24.0/255.0 blue:24.0/255.0 alpha:1.0] set];
		CGContextFillRect(c, CGRectMake(0, self.bounds.size.height / 2, self.bounds.size.width, self.bounds.size.height / 2));
		[[UIColor colorWithRed:14.0/255.0 green:14.0/255.0 blue:14.0/255.0 alpha:1.0] set];
		CGContextFillRect(c, CGRectMake(0, self.bounds.size.height / 2, 0.5, self.bounds.size.height / 2));
		CGContextFillRect(c, CGRectMake(self.bounds.size.width - 0.5, self.bounds.size.height / 2, 0.5, self.bounds.size.height / 2));
	}
}

- (void)setFrame:(CGRect)aFrame {
	[super setFrame:aFrame];
	[self setNeedsDisplay];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	UIEdgeInsets imageInsets = UIEdgeInsetsMake(floor((self.bounds.size.height / 2) -
												(self.imageView.image.size.height / 2)),
												floor((self.bounds.size.width / 2) -
												(self.imageView.image.size.width / 2)),
												floor((self.bounds.size.height / 2) -
												(self.imageView.image.size.height / 2)),
												floor((self.bounds.size.width / 2) -
												(self.imageView.image.size.width / 2)));
	self.imageEdgeInsets = imageInsets;
}

- (void)adjustImageForOrientation {
    NSString *orientationAwareName = self.imageName;
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) && 
        self.landscapeImageNameSuffix && [self.landscapeImageNameSuffix length] > 0) {
        orientationAwareName = [[[self.imageName stringByDeletingPathExtension] stringByAppendingString:self.landscapeImageNameSuffix] stringByAppendingPathExtension:[self.imageName pathExtension]];
    }
    [self assignImages:orientationAwareName selectedImageNameSuffix:self.selectedImageNameSuffix];
}

@end
