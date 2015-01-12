//
//  Face.swift
//  BART Alarm
//
//  Created by David Mazza on 12/15/14.
//  Copyright (c) 2014 Peaking. All rights reserved.
//

import UIKit

class Face: UIView, IntervalMarkerDelegate {
    
    var radius: Double
    var markers: [IntervalMarker]?
    var interval: Double? = 1/240
    var nextMarker: Int? = 1
//    var superIntervals: NSDictionary? = nil
    
    init(radius: Double, originPoint: CGPoint) {
        let diameter = CGFloat(radius * 2)
        self.radius = radius
        super.init(frame: CGRectMake(originPoint.x, originPoint.y, diameter, diameter))
        viewDidInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        radius = 0
        super.init(coder: aDecoder)
        radius = Double(self.frame.size.width) * 0.5
        viewDidInit()
    }
    
    func viewDidInit() {
        let numberOfIntervals: Int = Int(1/self.interval!)
        self.markers = Array()
        for index in 0...(numberOfIntervals - 1) {
            let angleInRadians = Double(index) * self.interval! * M_PI * 2
            var marker = IntervalMarker(thickness: 0.7, length: 18, angularPosition: angleInRadians, color: UIColor.grayColor())
            marker.face = self
            marker.draw()
            self.addSubview(marker)
            self.markers!.append(marker)
        }
        
        NSTimer.scheduledTimerWithTimeInterval(1.0 * self.interval!, target: self, selector: "highlightMarker:", userInfo: nil, repeats: true)
    }
    
    func highlightMarker(index: Int) {
        var marker = self.markers![self.nextMarker!++ % Int(1/self.interval!)]
        
        marker.backgroundColor = UIColor.redColor()
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            marker.backgroundColor = UIColor.grayColor()
        }, completion: nil)
        
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
}
