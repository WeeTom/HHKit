// light@huohua.tv
#import "UIView+HHKit.h"

@implementation UIView (HHKit)
- (CGFloat)offsetX
{
    return self.frame.origin.x;
}

- (void)setOffsetX:(CGFloat)offsetX
{
    self.frame = CGRectMake(offsetX, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)offsetY
{
    return self.frame.origin.y;
}

- (void)setOffsetY:(CGFloat)offsetY
{
    self.frame = CGRectMake(self.frame.origin.x, offsetY, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

@end