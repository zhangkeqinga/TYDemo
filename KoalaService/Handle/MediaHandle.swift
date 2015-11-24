//
//  ImageHandle.swift
//  iFU_Doctor
//
//  Created by carlosk on 15/7/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit
private var uploadMediaBlock:((MediaM,Bool)->Void)?
class MediaHandle: BaseHandle {
	class func resizeImage(image:UIImage,maxSize:CGFloat = 256) -> UIImage{
		//如果宽度大于2014,要缩放
		let mSize = CGSizeMake(image.size.width * image.scale, image.size.height * image.scale)
		var newSize = mSize
		if newSize.height > maxSize {
			newSize.height = maxSize
		}
		if newSize.width / newSize.height != 1 {
			newSize.width = newSize.height*1
		}
		UIGraphicsBeginImageContext(newSize)
		image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
		let scaledImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext()
		return scaledImage
	}
	//上传本地的文件
//	
//	class func doUploadMedias(tempMedias:[MediaM],uploadMediaBlock1:((Int,Bool)->Void)){
//		if tempMedias.count > 0 {
//			iterationUploadMedias(tempMedias, nextIndex: 0, uploadMediaBlock1: uploadMediaBlock1)
//			return
//		}
//		uploadMediaBlock1(-1,true)
//		
//	}
//	private class func iterationUploadMedias(tempMedias:[MediaM],var nextIndex:Int = 0,uploadMediaBlock1:((Int,Bool)->Void)){
//		let media = tempMedias[nextIndex]
//		nextIndex++
//		doUploadMedia(media, uploadMediaBlock1: { (mesMedia, isSuccess) -> Void in
//			if !isSuccess {
//				uploadMediaBlock1(nextIndex-1,false)
//				return
//			}
//			media.msgBody = mesMedia.msgBody
//			if nextIndex >= tempMedias.count {
//				uploadMediaBlock1(-1,true)
//				return
//			}
//			//如果还有,则继续
//			self.iterationUploadMedias(tempMedias, nextIndex: nextIndex, uploadMediaBlock1: uploadMediaBlock1)
//			
//		})
//		
//	}
//	//	private class func  iterationUploadMedia(tempMedia:MsgMedicalM,uploadMediaBlock1:((Int,Bool)->Void)?{
//	//
//	//	}
//	class func doUploadMedia(tempMedia:MediaM,uploadMediaBlock1:((MediaM,Bool)->Void)?){
//		//开始上传
//		uploadMediaBlock = uploadMediaBlock1
//		let tm = ThreadM(apiIF: APIEnum.UploadMedia)
//		tm.autoShowProgressV = false
//		//如果是图片
//		if tempMedia.getType() == iFUMsgMedicalType.Image {
//			let fileName = "\(Int(NSDate().timeIntervalSince1970)).png"
//			let filePath = COFileTool.saveImage(tempMedia.tempImage!, fileName: fileName)
//			tempMedia.tempLocalFileName = fileName
//			if filePath == nil {
//				currentVC!.alert("系统出错")
//				if let block = uploadMediaBlock {
//					block(tempMedia,false)
//				}
//				return
//			}
//			tempMedia.tempLocalFilePath = filePath!
//		}
//		tm.objectValue = tempMedia
//		tm.postMe { (tm_) -> Void in
//			if let block = uploadMediaBlock {
//				block(tempMedia,tm_.receiveIsSuccess)
//			}
//		}
//	}
	
}
