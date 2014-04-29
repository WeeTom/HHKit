// light@huohua.tv
#import "HHActionSheet.h"
@interface HHActionSheet () <UIActionSheetDelegate>
@property (strong, nonatomic) NSMutableArray *blocks;
@property (strong, nonatomic) NSMutableDictionary *performDic;
@end

@implementation HHActionSheet
- (NSMutableArray *)blocks
{
    if (!_blocks) {
        _blocks = [[NSMutableArray alloc] init];
    }

    return _blocks;
}

- (id)initWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle
{
    self = [self initWithTitle:title];
    return self;
}

- (id)initWithTitle:(NSString *)title
{
    self = [self initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    return self;
}

- (NSInteger)addButtonWithTitle:(NSString *)title
{
    return [self addButtonWithTitle:title block:^{}];
}

- (NSInteger)addButtonWithTitle:(NSString *)title block:(HHBasicBlock)block
{
    [self.blocks addObject:[block copy]];
    return [super addButtonWithTitle:title];
}

- (NSInteger)addButtonWithTitle:(NSString *)title block:(HHBasicBlock)block performAfterDismiss:(BOOL)performAfterDismiss
{
    HHBasicBlock blockCopy = [block copy];
    [self.blocks addObject:blockCopy];
    if (performAfterDismiss) {
        if (!self.performDic) {
            self.performDic = [NSMutableDictionary dictionary];
        }
        [self.performDic setObject:@YES forKey:blockCopy];
    }
    return [super addButtonWithTitle:title];
}

- (NSInteger)addDestructiveButtonWithTitle:(NSString *)title block:(HHBasicBlock)block
{
    NSInteger index = [self addButtonWithTitle:title block:block];
    self.destructiveButtonIndex = self.numberOfButtons - 1;
    
    return index;
}

- (void)addCancelButtonWithTitle:(NSString *)title
{
    [self addCancelButtonWithTitle:title block:^{}];
}

- (void)addCancelButtonWithTitle:(NSString *)title block:(HHBasicBlock)block
{
    [self addButtonWithTitle:title block:block];
    self.cancelButtonIndex = self.numberOfButtons - 1;
}

- (void)actionSheet:(HHActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    HHBasicBlock block = [self.blocks objectAtIndex:buttonIndex];

    if ([[self.performDic objectForKey:block] boolValue]) {
        return;
    }
    
    block();
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    HHBasicBlock block = [self.blocks objectAtIndex:buttonIndex];
    
    if ([[self.performDic objectForKey:block] boolValue]) {
        block();
    }    
}
@end