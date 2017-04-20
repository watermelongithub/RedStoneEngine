//
//  ViewController.swift
//  TestMetal
//
//  Created by 刘鹏飞 on 2017/4/7.
//  Copyright © 2017年 刘鹏飞. All rights reserved.
//

import Cocoa
import Metal
import QuartzCore

class ViewController: NSViewController {


    var displayLink: CVDisplayLink?
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    
    let displayLinkOutputCallback: CVDisplayLinkOutputCallback = {(displayLink:CVDisplayLink, inNow: UnsafePointer<CVTimeStamp>, inOutputTime: UnsafePointer<CVTimeStamp>, flagsIn: CVOptionFlags, flagsOut: UnsafeMutablePointer<CVOptionFlags>, displayLinkContext: UnsafeMutableRawPointer?) -> CVReturn in
        
        let view = unsafeBitCast(displayLinkContext, to: MyView.self)
        view.Render()
        
        return kCVReturnSuccess
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        (view as! MyView).InitMetal()
        
        CVDisplayLinkCreateWithActiveCGDisplays(&displayLink);
        
        
        CVDisplayLinkSetOutputCallback(displayLink!, displayLinkOutputCallback, UnsafeMutableRawPointer(Unmanaged.passUnretained(view).toOpaque()))
        CVDisplayLinkStart(displayLink!)
        
        
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func Tick()
    {
        
    }
    

}

