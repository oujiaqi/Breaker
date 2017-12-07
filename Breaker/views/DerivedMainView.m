//
//  DerivedMainView.m
//  Breaker
//
//  Created by colinou on 2017/12/7.
//  Copyright © 2017年 oujiaqi. All rights reserved.
//

#import "DerivedMainView.h"
#import "DerivedFullScreenOverView.h"

@interface DerivedMainView() <SourceFullScreenOverViewDelegate>
@end

@implementation DerivedMainView

- (void)packUpAllPopUpView:(id)sender {
//    [super packUpAllPopUpView:self];
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UITextField *myTextInput = [[UITextField alloc] init];
        myTextInput.frame = CGRectMake(125, 50, 150, 30);
        
        myTextInput.backgroundColor = [UIColor whiteColor];
        myTextInput.borderStyle = UITextBorderStyleRoundedRect;
        myTextInput.placeholder = @"弹起键盘";
        myTextInput.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        UIButton *myBtn = [[UIButton alloc] initWithFrame:CGRectMake(125, 150, 150, 30)];
        [myBtn setTitle:@"弹出框委托" forState:UIControlStateNormal];
        //        [myBtn setTitle:@"已经弹出" forState:UIControlStateHighlighted];
        [myBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        [myBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        [myBtn setBackgroundColor:[UIColor grayColor]];
        [myBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:myTextInput];
        [self addSubview:myBtn];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)click {
    [self performSelector:@selector(show) withObject:nil afterDelay:5.0f];
}

- (void)show {
    CGRect screenRect = [UIScreen mainScreen].bounds;
    DerivedFullScreenOverView *dov = [[DerivedFullScreenOverView alloc] initWithFrame:screenRect];
    dov.sourceFullScreenOverViewDelegate = self;
    //    [self addSubview:sov];
    CABasicAnimation *anima = [CABasicAnimation animation];
    anima.keyPath = @"position";
    anima.fromValue=[NSValue valueWithCGPoint:CGPointMake(screenRect.size.width/2, 0)];
    anima.toValue=[NSValue valueWithCGPoint:CGPointMake(screenRect.size.width/2, screenRect.size.height/2)];
    anima.removedOnCompletion=NO;
    anima.fillMode=kCAFillModeForwards;
    [dov.layer addAnimation:anima forKey:nil];
    [[[UIApplication sharedApplication] keyWindow] addSubview:dov];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}


@end
