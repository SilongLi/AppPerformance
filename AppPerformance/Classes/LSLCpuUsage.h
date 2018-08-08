//
//  LSLCpuUsage.h
//  AppPerformance
//
//  Created by lisilong on 2018/8/7.
//  Copyright © 2018 lisilong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSLCpuUsage : NSObject

// 获取当前应用在CPU中的占有率
+ (double)getCpuUsage;

@end
