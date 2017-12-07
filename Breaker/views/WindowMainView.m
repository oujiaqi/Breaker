//
//  WindowMainView.m
//  Breaker
//
//  Created by ouou on 2017/12/7.
//  Copyright © 2017年 oujiaqi. All rights reserved.
//

#import "WindowMainView.h"
#import "WindowFullScreenOverView.h"

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
//    CGRect screenRect = [UIScreen mainScreen].bounds;
//    WindowFullScreenOverView *wsov = [[WindowFullScreenOverView alloc] initWithFrame:screenRect];
//    wsov.windowLevel = UIWindowLevelAlert+1;
//    
//    [wsov makeKeyAndVisible];
    // 1、初始化
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示"
                                                                             message:@"输入您要添加的用户名"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    // 2、添加文本输入框
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        // 此处设置文本输入框常用属性配置
    }];
    
    // 3、添加取消按钮
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          // 此处处理点击取消按钮逻辑
                                                      }]];
    
    
    // 4、添加确定按钮
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          // 此处处理点击确定按钮逻辑
                                                          
                                                          // 根据下标（文本输入框下标从0开始，根据添加先后顺序计算）获取文本输入框
                                                          UITextField *textField = alertController.textFields[0];
                                                          
                                                          // 获取文本输入框上的文本
                                                          NSString *text = textField.text;
                                                          
                                                          // 接着其他处理逻辑...
                                                      }]];
    
    // 5、模态切换显示弹出框
//    [self.view presentViewController:alertController
//                       animated:YES
//                     completion:nil];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

@end
