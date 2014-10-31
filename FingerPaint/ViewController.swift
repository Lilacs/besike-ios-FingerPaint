//
//  ViewController.swift
//  FingerPaint
//
//  Created by 张鹏 on 14/10/30.
//  Copyright (c) 2014年 gotoitem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var canvasView: CanvasView!
    weak var clearButton: UIButton!
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set canvas view
        setupCanvasView()
        //set color button
        setupColorButtons()
        //set clean button
        setupClearButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setupCanvasView(){
        let canvasView = CanvasView(frame: self.view.frame)
        self.canvasView = canvasView
        self.canvasView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.canvasView)
    }
    
    func setupColorButtons() {
        let colors: [UIColor] = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            UIColor(red: 0x17/255.0, green: 0xA3/255.0, blue: 0xA5/255.0, alpha: 1),
            UIColor(red: 0x8D/255.0, green: 0xBF/255.0, blue: 0x67/255.0, alpha: 1),
            UIColor(red: 0xFC/255.0, green: 0xCB/255.0, blue: 0x5F/255.0, alpha: 1),
            UIColor(red: 0xFC/255.0, green: 0x6E/255.0, blue: 0x59/255.0, alpha: 1),
        ]
        let positions = [(33,43),(86,43),(138,43),(190,43),(242,43)]
        let size = (44,44)
        var width = CGFloat(size.0)
        var height = CGFloat(size.1)
        for (index, value) in enumerate(positions) {
            var x = CGFloat(value.0)
            var y = CGFloat(value.1)
            var button = UIButton(frame: CGRectMake(x, y, width, height))
            button.backgroundColor = colors[index]
            button.addTarget(self,action:"buttonTapped:",forControlEvents:UIControlEvents.TouchUpInside)
            buttons.append(button)
            self.view.addSubview(button)
        }
    }
    
    func setupClearButton() {
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        self.clearButton = button
        button.frame = CGRect(x: 267, y: 518, width: 37, height: 30)
        button.setTitle("Clear", forState: UIControlState.Normal)
        button.addTarget(self, action: "clean", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(clearButton)
    }
    
    func buttonTapped(sender: UIButton) {
        for button in buttons {
           button.layer.shadowRadius = 0
        }
        
        sender.layer.shadowColor = UIColor(white: 0.4, alpha: 1).CGColor
        sender.layer.shadowOffset = CGSize(width: 0, height: 0)
        sender.layer.shadowRadius = 3
        sender.layer.shadowOpacity = 1
        
        canvasView.currentColor = sender.backgroundColor!.CGColor
    }
    
    func clean() {
        canvasView.clean()
    }
    
    

}

