//
//  COFileTool.swift
//  iFU_Doctor
//
//  Created by carlosk on 15/7/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class COFileTool: COBaseTool {
	//存储图片
	class func saveImage(image:UIImage,fileName:String)->String?{
		let imageData =  UIImagePNGRepresentation(image)!
		
		let paths = NSSearchPathForDirectoriesInDomains(.CachesDirectory,.UserDomainMask, true)
		let documentsDirectory = paths[0]
//		let fullPathToFile = documentsDirectory.stringByAppendingPathComponent(fileName)
		let fullPathToFile = documentsDirectory.stringByAppendingString(fileName)
		let isSuccess = imageData.writeToFile(fullPathToFile, atomically: false)
		if !isSuccess {
			log("存储失败")
			return nil
		}
		return fullPathToFile
	}

}
