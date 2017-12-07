//
//  DerivedFullScreenOverView.m
//  Breaker
//
//  Created by colinou on 2017/12/7.
//  Copyright © 2017年 oujiaqi. All rights reserved.
//

#import "DerivedFullScreenOverView.h"

@implementation DerivedFullScreenOverView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *myBtn = [[UIButton alloc] initWithFrame:CGRectMake(150, 550, 100, 30)];
        [myBtn setTitle:@"关闭" forState:UIControlStateNormal];
        //        [myBtn setTitle:@"已经弹出" forState:UIControlStateHighlighted];
        [myBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        [myBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        [myBtn setBackgroundColor:[UIColor grayColor]];
        [myBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:myBtn];
        self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.522];
        //        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)click {
    [self removeFromSuperview];
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (self.sourceFullScreenOverViewDelegate) {
        [self.sourceFullScreenOverViewDelegate packUpAllPopUpView:self];
    }
}

@end
