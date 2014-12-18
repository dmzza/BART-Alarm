//
//  IntervalMarker.swift
//  BART Alarm
//
//  Created by David Mazza on 12/15/14.
//  Copyright (c) 2014 Peaking. All rights reserved.
//

import UIKit

protocol IntervalMarkerDelegate {
    var radius: Double { get }
}

class IntervalMarker: UIView {
    
    var thickness: Double!
    var length: Double!
    var angularPosition: Double! // radians
    var color: UIColor? = UIColor.blackColor()
    var face: IntervalMarkerDelegate!
    
    init(thickness: Double, length: Double, angularPosition: Double, color: UIColor?) {
        super.init()
        self.thickness = thickness;
        self.length = length;
        self.angularPosition = angularPosition;
        self.color = color;
        
    }
    
    override init(frame: CGRect) {
//        if let thickness = self.thickness {
//            super.init(frame: frame)
//        } else {
//            self.thickness = 1.0;
//            self.length = 5.0;
//            self.angularPosition = 0.0;
            super.init(frame: frame)
//        }
    }
    
    required init(coder aDecoder: NSCoder) {
        self.thickness = 1.0;
        self.length = 5.0;
        self.angularPosition = 0.0;
        super.init(coder: aDecoder)
    }
    
    func draw() {
        if let face = self.face {
            let angleInRadians = CGFloat(self.angularPosition)
            let radius = CGFloat(face.radius)
            self.frame = CGRectMake(cos(angleInRadians) * radius, sin(angleInRadians) * radius, CGFloat(thickness), CGFloat(length))
            self.transform = CGAffineTransformMakeRotation(angleInRadians + CGFloat(M_PI_2));
            self.backgroundColor = self.color;
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
}
