// light@huohua.tv
#import "HHLabel.h"
#import "UIView+HHKit.h"

@implementation UILabel (HHKit)

- (void)autoResize:(CGSize)maxSize
{
    CGSize size = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.font} context:nil].size;
    self.frame = CGRectMake(self.hh_originX, self.hh_originY, size.width, size.height);
}

@end


@implementation HHLabel

@end
