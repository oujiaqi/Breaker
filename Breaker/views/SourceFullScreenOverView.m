//
//  SourceFullScreenOverView.m
//  Breaker
//
//  Created by colinou on 2017/12/7.
//  Copyright © 2017年 oujiaqi. All rights reserved.
//

#import "SourceFullScreenOverView.h"

@implementation SourceFullScreenOverView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (_sourceFullScreenOverViewDelegate) {
        [_sourceFullScreenOverViewDelegate packUpAllPopUpView:self];
    }
}

@end
