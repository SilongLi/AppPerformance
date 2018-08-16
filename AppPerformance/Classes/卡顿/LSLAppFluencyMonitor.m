//
//  AppPerformance
//
//  Created by lisilong on 2018/8/9.
//  Copyright © 2018 lisilong. All rights reserved.
//

#import "LSLAppFluencyMonitor.h"
#import "LSLBacktraceLogger.h"


#define lsl_SEMAPHORE_SUCCESS 0
static BOOL lsl_is_monitoring = NO;
static dispatch_semaphore_t lsl_semaphore;
static NSTimeInterval lsl_time_out_interval = 0.05;


@implementation LSLAppFluencyMonitor

static inline dispatch_queue_t __lsl_fluecy_monitor_queue() {
    static dispatch_queue_t lsl_fluecy_monitor_queue;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        lsl_fluecy_monitor_queue = dispatch_queue_create("com.dream.lsl_monitor_queue", NULL);
    });
    return lsl_fluecy_monitor_queue;
}

static inline void __lsl_monitor_init() {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lsl_semaphore = dispatch_semaphore_create(0);
    });
}

#pragma mark - Public
+ (instancetype)monitor {
    return [LSLAppFluencyMonitor new];
}

- (void)startMonitoring {
    if (lsl_is_monitoring) { return; }
    lsl_is_monitoring = YES;
    __lsl_monitor_init();
    dispatch_async(__lsl_fluecy_monitor_queue(), ^{
        while (lsl_is_monitoring) {
            __block BOOL timeOut = YES;
            dispatch_async(dispatch_get_main_queue(), ^{
                timeOut = NO;
                dispatch_semaphore_signal(lsl_semaphore);
            });
            [NSThread sleepForTimeInterval: lsl_time_out_interval];
            if (timeOut) {
                [LSLBacktraceLogger lsl_logMain];       // 打印主线程调用栈
//                [LSLBacktraceLogger lsl_logCurrent];    // 打印当前线程的调用栈
//                [LSLBacktraceLogger lsl_logAllThread];  // 打印所有线程的调用栈
            }
            dispatch_wait(lsl_semaphore, DISPATCH_TIME_FOREVER);
        }
    });
}

- (void)stopMonitoring {
    if (!lsl_is_monitoring) { return; }
    lsl_is_monitoring = NO;
}


@end

