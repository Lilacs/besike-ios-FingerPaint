//
//  Path.swift
//  FingerPaint
//
//  Created by 张鹏 on 14/10/30.
//  Copyright (c) 2014年 gotoitem. All rights reserved.
//

import Foundation
import UIKit

class Path {
    var points: [CGPoint] = []
    let color: CGColor
    
    init(color: CGColor) {
        self.color = color
    }
    
    func add(point: CGPoint) {
        points.append(point)
    }
}