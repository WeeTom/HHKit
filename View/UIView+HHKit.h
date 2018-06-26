// light@huohua.tv
#import <UIKit/UIKit.h>

@interface UIView (HHKit)
@property (assign, nonatomic) CGPoint hh_origin;
@property (assign, nonatomic) CGSize hh_size;

@property (assign, nonatomic) CGFloat hh_originX;
@property (assign, nonatomic) CGFloat hh_originY;
@property (assign, nonatomic) CGFloat hh_width;
@property (assign, nonatomic) CGFloat hh_height;

@property (readonly) CGFloat hh_right;
@property (readonly) CGFloat hh_bottom;


- (void)hh_show;
- (void)hh_hide;
- (void)hh_fadeInWithDuration:(NSTimeInterval)duration;
- (void)hh_fadeOutWithDuration:(NSTimeInterval)duration;
@end
