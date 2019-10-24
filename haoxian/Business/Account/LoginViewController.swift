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
        var leftInterval = 27;
        
        
        //关闭按钮
        let closeBtn = UIButton(type: .custom);
        closeBtn.frame = CGRect(x:leftInterval - 5,y:Int(40 - 5 + UIScreenControl().heightOfAddtionalHeader),width: 14 + 10,height: 14 + 10);
        closeBtn.setImage(UIImage(named: "guanbi"), for:.normal);
        self.view.addSubview(closeBtn);
        
        //标题
        let titleLabel = UILabel();
        titleLabel.frame = CGRect(x: leftInterval, y: Int(117 + UIScreenControl().heightOfAddtionalHeader), width: 120, height: 23);
        titleLabel.font = FONT16;
        titleLabel.textColor = Color_151515;
        titleLabel.text = "欢迎登录";
        self.view.addSubview(titleLabel);
        
        //手机号输入框
        let phoneTextField = UITextField();
        phoneTextField.frame = CGRect(x: CGFloat(leftInterval), y: 181 + UIScreenControl().heightOfAddtionalHeader, width: MAINWIDTH - CGFloat(leftInterval * 2), height: 50);
        phoneTextField.font = UIFont.systemFont(ofSize: 16);
        phoneTextField.backgroundColor = Color_F8F8F9;
        phoneTextField.textColor = Color_151515;
        phoneTextField.placeholder = "输入手机号";
        let leftView:UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 38, height: 50));
        leftView.backgroundColor = UIColor.green;
        let phoneImageView:UIImageView = UIImageView.init(image: UIImage(named: "shoujihao"));
        phoneImageView.frame = CGRect(x: 12, y: 16, width: 15, height: 18);
        leftView.addSubview(phoneImageView);
        phoneTextField.leftView = leftView;
        phoneTextField.leftViewMode = uit;
        self.view.addSubview(phoneTextField);
        
        //验证码输入框
        //登录按钮
        //账户说明
    }
}
