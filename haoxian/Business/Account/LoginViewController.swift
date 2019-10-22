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
        
        self.view.backgroundColor = UIColor.white;
        let closeBtn = UIButton(type: .custom);
        closeBtn.frame = CGRect(x:27 - 5,y:40 - 5,width: 14 + 10,height: 14 + 10);
        closeBtn.backgroundColor = UIColor.green;
        self.view.addSubview(closeBtn);
        
        let titleLabel = UILabel();
        titleLabel.frame = CGRect(x: 27, y: 117, width: 120, height: 23);
        titleLabel.font = UIFont.systemFont(ofSize: 24);
        titleLabel.textColor = UIColor.init(red: 21/255, green: 21/255, blue: 21/255, alpha: 1);
        titleLabel.text = "欢迎登录";
        self.view.addSubview(titleLabel);
    }
}
