//
//  SourceMainView.m
//  Breaker
//
//  Created by colinou on 2017/12/7.
//  Copyright © 2017年 oujiaqi. All rights reserved.
//

#import "SourceMainView.h"
#import "SourceFullScreenOverView.h"

@interface SourceMainView() <SourceFullScreenOverViewDelegate>

@end

@implementation SourceMainView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)packUpAllPopUpView:(id)sender {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

@end
