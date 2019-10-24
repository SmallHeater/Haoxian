//
//  UIScreenControl.swift
//  haoxian
//
//  Created by mac on 2019/10/22.
//  Copyright © 2019 xianjun wang. All rights reserved.
//  屏幕控制器

import UIKit



class UIScreenControl: NSObject {

    static var isFullScreen: Bool {
        if #available(iOS 11, *) {
            guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
                return false
            }
            
            if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
                print(unwrapedWindow.safeAreaInsets)
                return true
            }
        }
        return false
    }
    
    //刘海屏额外的高度
    let heightOfAddtionalHeader:CGFloat = {
        
        if isFullScreen{

           return 24.0

        }else{

           return 0.0
        }
    }()
    
    //底部非安全区域高度
    
    let heightOfAddtionalFooter:CGFloat = {
        
        if isFullScreen{
            
              return 34.0
            
        }else{
            
              return 0.0
            
                    }
        
    }()
    
    
    
    
    
}
