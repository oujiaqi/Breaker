//
//  WindowMainView.m
//  Breaker
//
//  Created by ouou on 2017/12/7.
//  Copyright © 2017年 oujiaqi. All rights reserved.
//

#import "WindowMainView.h"
#import "WindowFullScreenOverView.h"

@interface WindowMainView () <AlertWindowDelegate>

@end


@implementation WindowMainView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
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
        [myBtn setTitle:@"弹出框窗口" forState:UIControlStateNormal];
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

- (void)releaseWindow:(id)sender {
    NSLog(@"销毁 window");
    self.coverWindow = nil;
}

- (void)click {
    [self performSelector:@selector(show) withObject:nil afterDelay:5.0f];
//    CGRect screenRect = [UIScreen mainScreen].bounds;
//    WindowFullScreenOverView *wsov = [[WindowFullScreenOverView alloc] initWithFrame:screenRect];
//    wsov.windowLevel = UIWindowLevelAlert+1;
//    
//    [wsov makeKeyAndVisible];
    NSLog(@"tanchutanchu");
//    [[UIApplication sharedApplication] keyWindow].windowLevel = UIWindowLevelAlert-1;
//    UIWindow *owindow = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, 100,100)];
//    owindow.windowLevel = UIWindowLevelAlert+1;
//    owindow.backgroundColor = [UIColor clearColor];
////    oimgv=[[YFGIFImageView alloc]initWithFrame:self.view.bounds];
////    oimgv.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.522];
////    [YFGIFImageView viewAnimation:_imgv];
////    _imgv.userInteractionEnabled = YES;
////    [_window addSubview:_imgv];
//    [owindow makeKeyAndVisible];
}

- (void)show {
    NSLog(@"NewWindow");
    WindowFullScreenOverView *temp = [[WindowFullScreenOverView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [temp setDelegate:self];
    temp.windowLevel = UIWindowLevelAlert+1;
    temp.hidden = NO;
    [temp makeKeyWindow];
    self.coverWindow = temp;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

@end
