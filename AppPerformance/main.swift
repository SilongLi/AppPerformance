//
//  main.swift
//  AppPerformance
//
//  Created by lisilong on 2018/8/8.
//  Copyright © 2018 lisilong. All rights reserved.
//

import UIKit

var appStartLaunchTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()

UIApplicationMain(
    CommandLine.argc,
    UnsafeMutableRawPointer(CommandLine.unsafeArgv)
        .bindMemory(
            to: UnsafeMutablePointer<Int8>.self,
            capacity: Int(CommandLine.argc)),
    nil,
    NSStringFromClass(AppDelegate.self)
)
