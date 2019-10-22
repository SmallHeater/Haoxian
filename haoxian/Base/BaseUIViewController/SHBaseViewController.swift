//
//  SHBaseViewController.swift
//  haoxian
//
//  Created by xianjun wang on 2019/10/22.
//  Copyright © 2019 xianjun wang. All rights reserved.
//  base页面

import UIKit



class SHBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let workingQueue = DispatchQueue(label: "my_queue")
        // 派发到刚创建的队列中，GCD 会负责进⾏线程调度
        workingQueue.async {
            // 在 workingQueue 中异步进⾏
            Thread.sleep(forTimeInterval: 2) // 模拟两秒的执⾏时间
            DispatchQueue.main.async {
                // 返回到主线程更新 UI
                let logInVC = LoginViewController();
                self.present(logInVC, animated: YES, completion: {
                    
                });
            }
        }
    }
}
