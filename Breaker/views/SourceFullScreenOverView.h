//
//  SourceFullScreenOverView.h
//  Breaker
//
//  Created by colinou on 2017/12/7.
//  Copyright © 2017年 oujiaqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SourceFullScreenOverViewDelegate<NSObject>
- (void)packUpAllPopUpView:(id)sender;
@end

@interface SourceFullScreenOverView : UIView
@property (assign, nonatomic)id<SourceFullScreenOverViewDelegate> sourceFullScreenOverViewDelegate;
@end
