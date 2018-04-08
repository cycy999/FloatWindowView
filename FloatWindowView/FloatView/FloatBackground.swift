//
//  FloatBackground.swift
//  FloatWindowView
//
//  Created by 陈岩 on 2018/4/8.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit

class FloatBackground: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.init(white: 0, alpha: 0.3)
        
        addTarget(self, action: #selector(click), for: .touchUpInside)
    }
    
    @objc func click() {
        print("click")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        if let touch = (touches as NSSet).anyObject() as? UITouch {
            
            let nowLocation = touch.location(in: self)
            let preLocation = touch.previousLocation(in: self)
            
            let offsetX = nowLocation.x - preLocation.x
            let offsetY = nowLocation.y - preLocation.y
            
            var center = self.center
            center.x += offsetX
            center.y += offsetY
            
            //限制悬浮窗的边界
            center.x = center.x < 25 ? 25:center.x
            center.x = center.x > UIScreen.main.bounds.width - 25 ? UIScreen.main.bounds.width - 25:center.x
            
            center.y = center.y < 25 ? 25:center.y
            center.y = center.y > UIScreen.main.bounds.height - 25 ? UIScreen.main.bounds.height - 25 : center.y
            
            self.center = center
        }
    }
    

}
