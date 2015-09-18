// light@huohua.tv
#import "HHTextView.h"
#import "UIView+HHKit.h"

@interface HHTextView ()
@property (strong, nonatomic) UILabel *placeholderLabel;
@end

@implementation HHTextView
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    if (!self.font) {
        self.font = [UIFont systemFontOfSize:14];
    }
    CGSize textSize = [placeholder boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    if (!self.placeholderLabel) {
        self.placeholderLabel = [[UILabel alloc] init];
    }
    self.placeholderLabel.font = self.font;
    self.placeholderLabel.text = placeholder;
    self.placeholderLabel.textColor = [UIColor lightGrayColor];
    self.placeholderLabel.alpha = 0.45f;
    self.placeholderLabel.backgroundColor = [UIColor clearColor];
    self.placeholderLabel.frame = CGRectMake(8, 8, textSize.width, textSize.height);
    [self addSubview:self.placeholderLabel];
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    if (self.placeholderLabel && font) {
        self.placeholderLabel.font = font;
        CGSize textSize = [self.placeholderLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
        self.placeholderLabel.frame = CGRectMake(8, 8, textSize.width, textSize.height);
    }
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [[NSNotificationCenter defaultCenter] postNotificationName:UITextViewTextDidChangeNotification object:nil];
}

- (void)textViewDidChange:(UITextView *)textView
{
    NSString *content = [self text];
    
    if ([content length] == 0) {
        self.placeholderLabel.hidden = NO;
    } else {
        self.placeholderLabel.hidden = YES;
    }
}

@end
