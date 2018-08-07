//
//  CpuUsage.swift
//  AppPerformance
//
//  Created by lisilong on 2018/8/7.
//  Copyright © 2018 lisilong. All rights reserved.
//

import Foundation

//struct CpuUsage {
//    func getCPUInfo() -> Double {
//        var kr: kern_return_t
//        var threadList: thread_act_array_t?             // 保存当前Mach task的线程列表
//        var threadCount: mach_msg_type_number_t = 1        // 保存当前Mach task的线程个数
//        var threadInfo: thread_info_data_t              // 保存当前线程的信息列表
//        var threadInfoCount: mach_msg_type_number_t     // 保存当前线程的信息列表大小
//        var threadBasicInfo: thread_basic_info_t        // 线程的基本信息
//        var cpuUsage: Double = 0.0
//
//        // 通过“task_threads”API调用获取指定 task 的线程列表
//        //  mach_task_self_，表示获取当前的 Mach task
//        kr = task_threads(mach_task_self_, &threadList, &threadCount)
//        guard kr == KERN_SUCCESS else {
//            return -1
//        }
//
//        for i in 0..<threadCount {
//            threadInfoCount = mach_msg_type_number_t(THREAD_INFO_MAX)
//            // 通过“thread_info”API调用来查询指定线程的信息
//            //  flavor参数传的是THREAD_BASIC_INFO，使用这个类型会返回线程的基本信息，
//            //  定义在 thread_basic_info_t 结构体，包含了用户和系统的运行时间、运行状态和调度优先级等
//            kr = thread_info(threadList![Int(i)], thread_flavor_t(THREAD_BASIC_INFO), threadInfo as? thread_info_t, &threadInfoCount)
//            guard kr == KERN_SUCCESS else {
//                return -1
//            }
//
//            threadBasicInfo = thread_basic_info_t((threadInfo as? thread_basic_info_t)!)
//            let baseInfo: thread_basic_info = (threadBasicInfo as? thread_basic_info)!
//
//            let flags = baseInfo.flags & TH_FLAGS_IDLE
//            print("flags: %d", flags)
//            print("cpu: %d", Double(baseInfo.cpu_usage))
//            if (flags > 0) {
//                cpuUsage = cpuUsage + Double(baseInfo.cpu_usage)
//            }
//        }
//
//        cpuUsage = cpuUsage / Double(TH_USAGE_SCALE) * 100.0;
//
//        // 回收内存，防止内存泄漏
////        vm_deallocate(mach_task_self_, vm_offset_t(threadList), threadCount * size_t(thread_t));
//
//        return cpuUsage
//    }
//}
