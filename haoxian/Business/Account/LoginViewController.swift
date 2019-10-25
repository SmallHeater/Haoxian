//
//  LoginViewController.swift
//  haoxian
//
//  Created by xianjun wang on 2019/10/22.
//  Copyright © 2019 xianjun wang. All rights reserved.
//  登录页面

import UIKit
import Alamofire
//#import "SVProgressHUD.h"

class LoginViewController: SHBaseViewController {

    var phoneTextField:UITextField?
    
    
    //MARK:生命周期函数
    override func viewDidLoad() {
        super.viewDidLoad()

        self .drawUI();
    }
    
    /// GCD定时器倒计时⏳
    ///   - timeInterval: 循环间隔时间
    ///   - repeatCount: 重复次数
    ///   - handler: 循环事件, 闭包参数： 1. timer， 2. 剩余执行次数
    public func DispatchTimer(timeInterval: Double, repeatCount:Int, handler:@escaping (DispatchSourceTimer?, Int)->())
    {
        if repeatCount <= 0 {
            return
        }
        let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
        var count = repeatCount
        timer.schedule(wallDeadline: .now(), repeating: timeInterval)
        timer.setEventHandler(handler: {
            count -= 1
            DispatchQueue.main.async {
                handler(timer, count)
            }
            if count == 0 {
                timer.cancel()
            }
        })
        timer.resume()
    }
    
   
    
    //MARK:自定义函数
    func drawUI() {
        
        self.view.backgroundColor = UIColor.white;
        let leftInterval = 27;
        
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
        phoneTextField = UITextField();
        phoneTextField?.frame = CGRect(x: CGFloat(leftInterval), y: 181 + UIScreenControl().heightOfAddtionalHeader, width: MAINWIDTH - CGFloat(leftInterval * 2), height: 50);
        phoneTextField?.font = UIFont.systemFont(ofSize: 16);
        phoneTextField?.backgroundColor = Color_F8F8F9;
        phoneTextField?.textColor = Color_151515;
        phoneTextField?.placeholder = "输入手机号";
        let leftView:UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 38, height: 50));
        let phoneImageView:UIImageView = UIImageView.init(image: UIImage(named: "shoujihao"));
        phoneImageView.frame = CGRect(x: 12, y: 16, width: 15, height: 18);
        leftView.addSubview(phoneImageView);
        phoneTextField?.leftView = leftView;
        phoneTextField?.leftViewMode = UITextField.ViewMode.always;
        self.view.addSubview(phoneTextField!);
        
        //验证码输入框
        let verificationCodeTF = UITextField();
        verificationCodeTF.frame = CGRect(x: CGFloat(leftInterval), y: 251 + UIScreenControl().heightOfAddtionalHeader, width: MAINWIDTH - CGFloat(leftInterval * 2), height: 50);
        verificationCodeTF.font = UIFont.systemFont(ofSize: 16);
        verificationCodeTF.backgroundColor = Color_F8F8F9;
        verificationCodeTF.textColor = Color_151515;
        verificationCodeTF.placeholder = "输入验证码";
        let vcLeftView:UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 38, height: 50));
        let vcImageView:UIImageView = UIImageView.init(image: UIImage(named: "yanzhengma"));
        vcImageView.frame = CGRect(x: 12, y: 16, width: 15, height: 18);
        vcLeftView.addSubview(vcImageView);
        verificationCodeTF.leftView = vcLeftView;
        verificationCodeTF.leftViewMode = .always;
        let vcRightView:UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 90, height: 50));
        let vcBtn:UIButton = UIButton(type: .custom);
        vcBtn.frame = CGRect(x: 0, y: 0, width: 90, height: 50);
        vcBtn.titleLabel?.font = FONT14;
        vcBtn.setTitleColor(Color_B5B5BC, for: .normal);
        vcBtn.setTitle("获取验证码", for: .normal);
        // 监听按钮的点击事件
        vcBtn.reactive.controlEvents(.touchUpInside).observeValues { (button) in
            
            if (self.phoneTextField?.text?.isEmpty)! {
                
                print("空");
            }
            else{
           
                button.isUserInteractionEnabled = false;
                Alamofire.SessionManager.default.delegate.sessionDidReceiveChallenge = {
                    session,challenge in
                    return    (URLSession.AuthChallengeDisposition.useCredential,URLCredential(trust:challenge.protectionSpace.serverTrust!))
                }
                Alamofire.request("https://garage.jnmsywl.com/api/sms/send", method: .post, parameters: ["mobile": self.phoneTextField!.text! as Any,"code":"1234","event  ":"register"], encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
                    
                    guard response.result.isSuccess else {
                        
                        print("失败");
                        return
                    }
                    if let value = response.result.value {
                        
                        print(value);
                    }
                });
                self.DispatchTimer(timeInterval: 1, repeatCount: 60, handler: { (timer, count) in
                    
                    var title:String = "\(count)s后重发";
                    if count == 0{
                        
                        button.isUserInteractionEnabled = true;
                        title = "获取验证码";
                    }
                    vcBtn.setTitle(title, for: .normal);
                })
                //            }
                //            else{
                //
                //                print("请输入正确的手机号");
                //            }
            }
        }
        vcRightView.addSubview(vcBtn);
        verificationCodeTF.rightView = vcRightView;
        verificationCodeTF.rightViewMode = .always;
        self.view.addSubview(verificationCodeTF);
        //登录按钮
        let logInBtn:UIButton = UIButton(type: .custom);
        logInBtn.frame = CGRect(x: CGFloat(leftInterval), y: 326 + UIScreenControl().heightOfAddtionalHeader, width: MAINWIDTH - CGFloat(leftInterval * 2), height: 50);
        logInBtn.titleLabel?.font = FONT15;
        logInBtn.setTitleColor(UIColor.white, for: .normal);
        logInBtn.backgroundColor = Color_31B180;
        logInBtn.layer.shadowColor = UIColor.init(red: 91/255, green: 182/255, blue: 163/255, alpha: 0.5).cgColor;
        logInBtn.layer.shadowOffset = CGSize(width: 0, height: 3);
        logInBtn.layer.shadowOpacity = 1;
        logInBtn.layer.shadowRadius = 6;
        logInBtn.layer.cornerRadius = 3;
        logInBtn.setTitle("登录", for: .normal);
        logInBtn.reactive.controlEvents(.touchUpInside).observe { (button) in
            
        };
        self.view.addSubview(logInBtn);
        
        //账户说明
        let desLabel = UILabel();
        desLabel.frame = CGRect(x: leftInterval, y: Int(396 + UIScreenControl().heightOfAddtionalHeader), width: 260, height: 12);
        desLabel.font = FONT12;
        desLabel.textColor = Color_C2C2C2;
        desLabel.text = "未注册的手机号验证后自动创建好闲账户";
        self.view.addSubview(desLabel);
    }
}
