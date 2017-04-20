//
//  FBXImport.swift
//  TestMetal
//
//  Created by 刘鹏飞 on 2017/4/10.
//  Copyright © 2017年 刘鹏飞. All rights reserved.
//

import Foundation

class FBXImporter
{
    
    func readFile(filename: String) -> String? {
        let fileBase = URL(string : filename)
        //let file = fileBase?.appendingPathComponent(filename)
        
        
        let readHandler = try! FileHandle(forReadingFrom:fileBase!)
        let data = readHandler.readDataToEndOfFile()
        let readString = String(data: data, encoding: String.Encoding.utf8)
        
        return readString
    }
    
    func ImportFbx(filename:String)->FBXInfo{
        let filestring = readFile(filename: filename)
        let ret = FBXInfo(fbxstring: filestring!)
        return ret
    }
}
