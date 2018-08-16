//
//  AppPerformance
//
//  Created by lisilong on 2018/8/9.
//  Copyright © 2018 lisilong. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *  @brief  线程堆栈上下文输出
 */
@interface LSLBacktraceLogger : NSObject

+ (NSString *)lsl_backtraceOfAllThread;
+ (NSString *)lsl_backtraceOfMainThread;
+ (NSString *)lsl_backtraceOfCurrentThread;
+ (NSString *)lsl_backtraceOfNSThread:(NSThread *)thread;

+ (void)lsl_logMain;
+ (void)lsl_logCurrent;
+ (void)lsl_logAllThread;

+ (NSString *)backtraceLogFilePath;
+ (void)recordLoggerWithFileName: (NSString *)fileName;

@end
