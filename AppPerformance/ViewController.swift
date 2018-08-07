//
//  ViewController.swift
//  AppPerformance
//
//  Created by lisilong on 2018/8/7.
//  Copyright © 2018 lisilong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer: DispatchSourceTimer?  // GIF播放定时器

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showUsageInfo()
    }
    
    func showUsageInfo() {
        timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
        timer?.schedule(deadline: .now(), repeating: 1)
        timer?.setEventHandler(handler: {
            DispatchQueue.main.async {
                print("cpu usage: \(LSLCpuUsage.getCpuUsage())")
                print("Memory: resident_size: \(LSLApplicationMemory.getResidentMemory()) MB; phys_footprint: \(LSLApplicationMemory.getUsage()) MB")
            }
        })
        timer?.resume()
    }
}

