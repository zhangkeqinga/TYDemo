//
//  HttpOperation.swift
//  COXbry
//
//  Created by carlosk on 15/1/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//这个类是用来处理请求之前和数据返回之后的内容

import UIKit

public class COHttpOperation : COBaseModel{
	public class func operation(threadModel:COThreadM) -> Bool{
		//查找方法
		let methodName = threadModel.apiIF.methodName
		let seletorStr = "operation\(methodName):"
		let seleotor = Selector(seletorStr)
		if self.respondsToSelector(seleotor) {
			self.performSelectorOnMainThread(seleotor, withObject: threadModel,waitUntilDone:true)
			return true
		}else{
//			assertionFailure("COHttpOperation的子类没有实现\"\(seletorStr)\"这个方法")
			return false
		}
	}

	//	class func operationgetGuideInfo(threadModel:ThreadModel){
	////		Log("operationgetGuideInfo")
	//		threadModel.httpEntyModel.param["cguidecode"]=threadModel.stringValue
	//		threadModel.httpEntyModel.param["cmobile"]=threadModel.stringValue2
	//		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
	////			Log("ReceiveToBackgourBlock")
	//			if threadModel.receiveIsSuccess {
	//				//获取登录的数据
	//				let jsonDict = threadModel.receiveContent?.jsonContentParseDict()!
	//				var jsonDict1 = (jsonDict!)["data"] as [String:AnyObject]?
	//				jsonDict1 = jsonDict1!["guide"] as [String:AnyObject]?
	//				let guideModel = GuideModel(jsonDict: jsonDict1!)
	//				CommData.setMyGuide(guideModel)
	//			}
	//		}
	//	}
}
