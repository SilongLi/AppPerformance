//
//  LSLApplicationMemory.h
//  AppPerformance
//
//  Created by lisilong on 2018/8/7.
//  Copyright © 2018 lisilong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSLApplicationMemory : NSObject

// 获取当前应用的内存占用情况，和Xcode数值相差较大
+ (double)getResidentMemory;

// 获取当前应用的内存占用情况，和Xcode数值相近
+ (double)getMemoryUsage;

@end
