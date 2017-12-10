//
//  WindowFullScreenOverView.h
//  Breaker
//
//  Created by ouou on 2017/12/7.
//  Copyright © 2017年 oujiaqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlertWindowDelegate<NSObject>
- (void)releaseWindow:(id)sender;
@end

@interface WindowFullScreenOverView : UIWindow
@property (assign, nonatomic)id<AlertWindowDelegate> alertWindowDelegate;
- (void)setDelegate:(id)alertWindowDelegate;
@end
