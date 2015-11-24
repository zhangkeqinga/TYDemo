//
//  SecurityHO.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/4.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//安保相关

import UIKit

class SecurityHO: BaseHO {
//   GetSecurityInfoList
	class func operationGetSecurityInfoList(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (param) -> [String : AnyObject] in
			return param
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			
			if threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
			
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			let resultList = resultDict["itemList"] as! [NSDictionary]
			var result = [InfoM]()
			for (_,itemDict) in resultList.enumerate(){
				let item = InfoM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}
	//TODO: 获取当天的安防信息
	class func operationGetTodaySecurityInfo(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var param) -> [String : AnyObject] in
			param["batchId"] = threadModel.intValue ?? 0
			return param
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			
			if !threadMsg.receiveIsSuccess || threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
			
			let resultDict = threadMsg.receiveResultDict!
			//			//获取数组,返回
			let resultList = resultDict["batchItem"] as! [NSDictionary]
			var result = [InfoBatchM]()
			for (_,itemDict) in resultList.enumerate(){
				let item = InfoBatchM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}
	
	
	

}
