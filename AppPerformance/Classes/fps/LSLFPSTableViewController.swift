//
//  LSLFPSTableViewController.swift
//  AppPerformance
//
//  Created by lisilong on 2018/8/9.
//  Copyright © 2018 lisilong. All rights reserved.
//

import UIKit

let FPSCellKey = "FPSCell"

class LSLFPSTableViewController: UITableViewController {
    
    var closeBtn: UIButton = {
        let btn = UIButton.init(frame: CGRect.init(x: UIScreen.main.bounds.width - 70, y: 20, width: 60, height: 36))
        btn.addTarget(self, action: #selector(closeAction), for: UIControlEvents.touchUpInside)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.setTitle("close", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: FPSCellKey)
        LSLAppFluencyMonitor().startMonitoring()
    }
    
    // MARK: - actions
    
    @objc func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FPSCellKey, for: indexPath)
        cell.textLabel?.text = "卡顿"
        cell.imageView?.image = UIImage.init(named: "city")
        if (indexPath.row > 0 && indexPath.row % 10 == 0) {
            usleep(100000);
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

}
