//
//  KnowledgeHO.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class KnowledgeHO: BaseHO {
	class func operationGetKnowledgeInfoList(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var param) -> [String : AnyObject] in
//			"sonCategory": 0,
			param["sonCategory"] = threadModel.intValue ?? 0
			return param
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			
			if !threadMsg.receiveIsSuccess || threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
			
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			let resultList = resultDict["infoList"] as! [NSDictionary]
			var result = [InfoM]()
			for (_,itemDict) in resultList.enumerate(){
				let item = InfoM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}
	
	//获取知识库分类
	class func operationGetKnowledgeSonCategoryList(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { ( param) -> [String : AnyObject] in
			return param
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			
			if !threadMsg.receiveIsSuccess || threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
			
			let resultDict = threadMsg.receiveResultDict!
//			//获取数组,返回
			let resultList = resultDict["sonCategoryList"] as! [NSDictionary]
			var result = [CategoryM]()
			for (_,itemDict) in resultList.enumerate(){
				let item = CategoryM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}
	

	// 获取当天的知识
	class func operationGetTodayKnowledgeInfo(threadModel:COThreadM){
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
	//根据关键字查询知识列表
	class func operationGetKnowledgeInfoListByQuery(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var param) -> [String : AnyObject] in
			//			"sonCategory": 0,
			param["sonCategory"] = threadModel.intValue ?? 0
			param["queryCondition"] = threadModel.stringValue ?? ""
			return param
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			
			if !threadMsg.receiveIsSuccess || threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
			
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			let resultList = resultDict["infoList"] as! [NSDictionary]
			var result = [InfoM]()
			for (_,itemDict) in resultList.enumerate(){
				let item = InfoM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}

	}
	
	//根据关键字查询知识列表
	class func operationGetSecurityInfoListByQuery(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var param) -> [String : AnyObject] in
			//			"sonCategory": 0,
			param["sonCategory"] = threadModel.intValue ?? 0
			param["queryCondition"] = threadModel.stringValue ?? ""
			return param
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			
			if !threadMsg.receiveIsSuccess || threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
			
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			let resultList = resultDict["infoList"] as! [NSDictionary]
			var result = [InfoM]()
			for (_,itemDict) in resultList.enumerate(){
				let item = InfoM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
		
	}


}
