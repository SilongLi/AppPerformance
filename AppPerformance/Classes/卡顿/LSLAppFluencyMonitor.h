//
//  AppPerformance
//
//  Created by lisilong on 2018/8/9.
//  Copyright © 2018 lisilong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSLAppFluencyMonitor : NSObject


+ (instancetype)monitor;

- (void)startMonitoring;
- (void)stopMonitoring;

@end

NS_ASSUME_NONNULL_END
