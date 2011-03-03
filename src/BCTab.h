
@interface BCTab : UIButton {

}

- (id)initWithIconImageName:(NSString *)_imageName selectedImageNameSuffix:(NSString *)_selectedSuffix landscapeImageNameSuffix:(NSString *)_landscapeSuffix;
- (void)adjustImageForOrientation;

@end
