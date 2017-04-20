//
//  View.swift
//  TestMetal
//
//  Created by 刘鹏飞 on 2017/4/7.
//  Copyright © 2017年 刘鹏飞. All rights reserved.
//

import Foundation

import Metal
import MetalKit


class MyView : NSView
{
    
    
    var device:MTLDevice!=nil;
    var metalLayer:CAMetalLayer!=nil
    var clearcolortest = 0.0
    var VetexData:[Float] = [
        0.0, 1.0, 0.0,
        -1.0, -1.0, 0.0,
        1.0, -1.0, 0.0]
    
    var VetexBuffer:MTLBuffer!=nil
    var piplineState:MTLRenderPipelineState!=nil
    
    var commandQueue: MTLCommandQueue! = nil
    

    
    
     override init(frame frameRect: NSRect)
     {
        
        
        super.init(frame: frameRect)
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    
    
    func InitMetal()
    {
        device = MTLCreateSystemDefaultDevice()
        metalLayer = CAMetalLayer()
        metalLayer.device = device
        metalLayer.pixelFormat = .bgra8Unorm
        metalLayer.framebufferOnly = true
        metalLayer.frame = (layer?.frame)!
        
        layer?.addSublayer(metalLayer)
        
        let vetexbuffersize = VetexData.count * MemoryLayout.size(ofValue: VetexData[0])
        
        VetexBuffer = device.makeBuffer(bytes: VetexData, length: vetexbuffersize, options:MTLResourceOptions.storageModeManaged)
        
  
        
        let defaultLibrary = device.newDefaultLibrary()
        let frameshader = defaultLibrary?.makeFunction(name: "basic_fragment")
        let vetexshader = defaultLibrary?.makeFunction(name: "basic_vertex")
        
        
        let piplineDescriptor = MTLRenderPipelineDescriptor()
        piplineDescriptor.fragmentFunction = frameshader
        piplineDescriptor.vertexFunction = vetexshader
        piplineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        
        do
        {
            try piplineState = device.makeRenderPipelineState(descriptor: piplineDescriptor)
        }
        catch {
            print("create piplinestate failed")
        }
        
        
        if  !(piplineState != nil){
            print("create piplinestate failed")
        }
        
        commandQueue = device.makeCommandQueue()
        
        
        
        let importer = FBXImporter()
        var fbxinfo = importer.ImportFbx(filename: "/Users/liupengfei/Work/TestMetal/TestMetal/FBX/box.fbx")
        
        
    }
    
    
    func Render()
    {
        
        
        for index in 0...8{
            
            
            
            VetexData[index] = VetexData[index]+0.01
        }
        
 
        
        clearcolortest = clearcolortest+0.01;
        clearcolortest = clearcolortest-Double(Int( clearcolortest))
        
        let length = VetexData.count*MemoryLayout<Float>.size
        let geoPtr = VetexBuffer.contents().bindMemory(to: Float.self, capacity: length)
        geoPtr.assign(from: &VetexData, count: VetexData.count)

        VetexBuffer.didModifyRange(NSMakeRange(0, VetexData.count * MemoryLayout.size(ofValue: VetexData[0])))
        
        
        var drawable = metalLayer.nextDrawable()
        
        
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].texture = drawable?.texture
        renderPassDescriptor.colorAttachments[0].loadAction = .clear
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColor(red: clearcolortest, green: 104.0/255.0, blue: 5.0/255.0, alpha: 1.0)
        
        
        let commandBuffer = commandQueue.makeCommandBuffer()
        
        let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        renderEncoder.setRenderPipelineState(piplineState)
        renderEncoder.setVertexBuffer(VetexBuffer, offset: 0, at: 0)
        renderEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 3, instanceCount: 1)
        
       
        
        renderEncoder.endEncoding()
        
        commandBuffer.present(drawable!)
        commandBuffer.commit()
        
    }
    
    
    
    override func draw(_ dirtyRect: NSRect) {
    
        Render();
    
    
    }
}
