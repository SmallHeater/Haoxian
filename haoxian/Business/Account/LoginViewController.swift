//
//  LoginViewController.swift
//  haoxian
//
//  Created by xianjun wang on 2019/10/22.
//  Copyright © 2019 xianjun wang. All rights reserved.
//  登录页面

import UIKit

class LoginViewController: SHBaseViewController {

    //MARK:生命周期函数
    override func viewDidLoad() {
        super.viewDidLoad()

        self .drawUI();
    }
    
    //MARK:自定义函数
    func drawUI() {
        
        let closeBtn = UIButton(type: .custom);
        closeBtn.frame = CGRect(x:100,y:100,width: 100,height: 100);
        closeBtn.backgroundColor = UIColor.green;
        self.view.addSubview(closeBtn);
    }
}
