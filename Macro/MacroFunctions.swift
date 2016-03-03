//
//  MacroFunctions.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/2.
//  Copyright © 2016年 王涛. All rights reserved.
//

import Foundation

/// Debug Log
let debug = true
func DLog (value: Any , fileName : String = __FILE__, line : Int32 = __LINE__ ){
    if debug {
        print("文件：\(NSURL(string: fileName)!.lastPathComponent!)  行：\(line) 内容:\(value)\n")
    }
}

func kRgb(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor{
    return UIColor(red:r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}

func kFrame(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat) -> CGRect{
    return CGRectMake(x, y, width, height)
}

func kNib(nibName:String) ->UINib{
    return UINib(nibName:nibName, bundle: NSBundle.mainBundle())
}

/**
*  简写的实例化
*/
let kDefault = NSUserDefaults.standardUserDefaults()
let kNotificationCenter = NSNotificationCenter.defaultCenter()
