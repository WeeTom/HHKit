// light@huohua.tv
#import "UINavigationController+HHKit.h"

@implementation UINavigationController (HHKit)

- (void)customBackgroundWithImage:(UIImage *)image withShadowImage:(UIImage *)shadowImage
{
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

    self.navigationBar.shadowImage = shadowImage;
}

- (void)pushViewControllerWithBlock:(HHViewControllerBlock)viewController animated:(BOOL)animated {
    [self pushViewController:viewController() animated:animated];
}

- (void)popWithAnimated
{
    if (![self popViewControllerAnimated:YES]) {
        [self.visibleViewController dismissViewControllerAnimated:YES completion:^{}];
    }
}

- (void)replaceVisibleViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self pushViewController:viewController animated:animated];
    
    NSMutableArray *VCs = [self.viewControllers mutableCopy];
    [VCs removeObjectAtIndex:VCs.count - 2];
    [self setViewControllers:VCs animated:animated];
}

- (BOOL)isRootViewController:(UIViewController *)viewController
{
    UIViewController *rootViewController = [self.viewControllers objectAtIndex:0];
    return [rootViewController isEqual:viewController];
}

@end