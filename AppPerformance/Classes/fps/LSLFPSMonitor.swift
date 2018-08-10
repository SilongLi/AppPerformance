//
//  LSLFPSMonitor.swift
//  AppPerformance
//
//  Created by lisilong on 2018/8/9.
//  Copyright © 2018 lisilong. All rights reserved.
//

import UIKit

class LSLFPSMonitor: UILabel {

    private var link: CADisplayLink = CADisplayLink.init()
    private var count: NSInteger = 0
    private var lastTime: TimeInterval = 0.0
    private var fpsColor: UIColor = UIColor.green
    public var fps: Double = 0.0
    
    // MARK: - init
    
    override init(frame: CGRect) {
        var f = frame
        if f.size == CGSize.zero {
            f.size = CGSize(width: 55.0, height: 22.0)
        }
        super.init(frame: f)
        
        self.textColor = UIColor.white
        self.textAlignment = .center
        self.font = UIFont.init(name: "Menlo", size: 12.0)
        self.backgroundColor = UIColor.black
        
        link = CADisplayLink.init(target: LSLWeakProxy(target: self), selector: #selector(tick))
        link.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
    }
    
    deinit {
        link.invalidate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - actions
    
    @objc func tick(link: CADisplayLink) {
        guard lastTime != 0 else {
            lastTime = link.timestamp
            return
        }
        
        count += 1
        let delta = link.timestamp - lastTime
        guard delta >= 1.0 else {
            return
        }
        
        lastTime = link.timestamp
        fps = Double(count) / delta
        let fpsText = "\(String.init(format: "%.3f", fps)) FPS"
        count = 0
        
        let attrMStr = NSMutableAttributedString(attributedString: NSAttributedString(string: fpsText))
        if fps > 55.0{
            fpsColor = UIColor.green
        } else if(fps >= 50.0 && fps <= 55.0) {
            fpsColor = UIColor.yellow
        } else {
            fpsColor = UIColor.red
        }
        attrMStr.setAttributes([NSAttributedStringKey.foregroundColor:fpsColor], range: NSMakeRange(0, attrMStr.length - 3))
        attrMStr.setAttributes([NSAttributedStringKey.foregroundColor:UIColor.white], range: NSMakeRange(attrMStr.length - 3, 3))
        DispatchQueue.main.async {
            self.attributedText = attrMStr
        }
    }
}
