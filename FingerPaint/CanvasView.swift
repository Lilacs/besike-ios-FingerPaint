//
//  CanvasView.swift
//  FingerPaint
//
//  Created by 张鹏 on 14/10/30.
//  Copyright (c) 2014年 gotoitem. All rights reserved.
//

import UIKit

class CanvasView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
//    let zigzag = [(100,100),(100,150),(150,150),(150,200)]
    var context = UIGraphicsGetCurrentContext()
    var currentColor: CGColor = UIColor.blackColor().CGColor
    var paths: [Path] = [] {
        didSet(value){
            setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)

        for path in paths {
            CGContextSetStrokeColorWithColor(context, path.color)
            var size = path.points.count as Int
            
            if(size > 0){
                CGContextMoveToPoint(context, path.points[0].x, path.points[0].y)
                for var i = 1; i < size; i++ {
                    CGContextAddLineToPoint(context, path.points[i].x, path.points[i].y)
                }
            }
            CGContextStrokePath(context)
        }
        
        
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        paths.append(Path(color: currentColor))
        setNeedsDisplay()
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        paths.last?.add(point)
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
    }

    func clean() {
        self.paths = []
        setNeedsDisplay()
    }
    
    

}
