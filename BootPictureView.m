//
//  BootPictureView.m
//  GameBaby
//
//

#import "BootPictureView.h"
#import "MacroCommon.h"
@implementation BootPictureView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
//        
//        if ([[UIScreen mainScreen]bounds].size.height > 500) {
//            _imageNames = @[@"guide11@2x.png",@"guide12@2x.png",@"guide13@2x.png"];
//        }else{
//        _imageNames = @[@"guide1@2x.png",@"guide2@2x.png",@"guide3@2x.png"];
//        }
        
        _imageNames=@[@"help",@"help",@"help",@"help"];
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.bounces = NO;
        scrollView.contentSize = CGSizeMake(kDeviceWidth * _imageNames.count, kDeviceHeight);
        for (int i = 0; i <_imageNames.count; i ++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kDeviceWidth * i, 0, kDeviceWidth, kDeviceHeight)];
            imageView.image = [UIImage imageNamed:_imageNames[i]];
            [scrollView addSubview:imageView];
        }
        [self addSubview:scrollView];
    }
    return self;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate == NO) {
        [self scrollToPaging:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollToPaging:scrollView];
}

- (void)scrollToPaging:(UIScrollView *)scrollView
{
    int pageIndex = scrollView.contentOffset.x / kDeviceWidth;
    if (pageIndex >= _imageNames.count - 1) {
        scrollView.bounces = YES;
    }else
    {
        scrollView.bounces = NO;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x > scrollView.contentSize.width - kDeviceWidth)
    {
        float cWidth = scrollView.contentOffset.x - (scrollView.contentSize.width - kDeviceWidth);
        if (cWidth > 75) {
            [UIView animateWithDuration:0 animations:^{
                scrollView.contentOffset = CGPointMake(_imageNames.count * kDeviceWidth, 0);
                scrollView.alpha = 0;
            }completion:^(BOOL finished){
                [self removeFromSuperview];
            }];
        }
    }
}

@end
