// light@huohua.tv
#import "UIView+HHKit.h"

@implementation UIView (HHKit)

- (CGPoint)hh_origin
{
    return CGPointMake(self.hh_originX, self.hh_originY);
}

- (void)setHh_origin:(CGPoint)hh_origin
{
    self.frame = CGRectMake(hh_origin.x, hh_origin.y, self.hh_width, self.hh_height);
}

- (CGSize)hh_size
{
    return CGSizeMake(self.hh_width, self.hh_height);
}

- (void)setHh_size:(CGSize)hh_size
{
    self.frame = CGRectMake(self.hh_originX, self.hh_originY, hh_size.width, hh_size.height);
}

- (CGFloat)hh_originX
{
    return self.frame.origin.x;
}

- (void)setHh_originX:(CGFloat)hh_originX
{
    self.frame = CGRectMake(hh_originX, self.hh_originY, self.hh_width, self.hh_height);
}

- (CGFloat)hh_originY
{
    return self.frame.origin.y;
}

- (void)setHh_originY:(CGFloat)hh_originY
{
    self.frame = CGRectMake(self.hh_originX, hh_originY, self.hh_width, self.hh_height);
}

- (CGFloat)hh_width
{
    return self.frame.size.width;
}

- (void)setHh_width:(CGFloat)hh_width
{
    self.frame = CGRectMake(self.hh_originX, self.hh_originY, hh_width, self.hh_height);
}

- (CGFloat)hh_height
{
    return self.frame.size.height;
}

- (void)setHh_height:(CGFloat)hh_height
{
    self.frame = CGRectMake(self.hh_originX, self.hh_originY, self.hh_width, hh_height);
}

- (CGFloat)hh_right
{
    return self.hh_originX + self.hh_width;
}

- (CGFloat)hh_bottom
{
    return self.hh_originY + self.hh_height;
}


#pragma mark - Alpha
- (void)hh_show
{
    self.alpha = 1;
}

- (void)hh_hide
{
    self.alpha = 0;
}

#pragma mark - Animation
- (void)hh_fadeInWithDuration:(NSTimeInterval)duration
{
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 1;
    }];
}

- (void)hh_fadeOutWithDuration:(NSTimeInterval)duration
{
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 0;
    }];
}

@end
