//
//  TopicHO.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/9.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class TopicHO: BaseHO {
	//获取话题列表
	class func operationGetVariousTopicList(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { ( param) -> [String : AnyObject] in
			var param1  = param
			param1["category"] = threadModel.intValue ?? 1
			return param1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			
			if !threadMsg.receiveIsSuccess || threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
			
			let resultDict = threadMsg.receiveResultDict!
			//			//获取数组,返回
			let resultList = resultDict["infoList"] as! [NSDictionary]
			var result = [TopicM]()
			for (_,itemDict) in resultList.enumerate(){
				let item = TopicM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}
	
	
	// 发话题之前的传图片
	class func operationPostTopicPicPre(threadModel:COThreadM){
		var url:NSString = APIEnum.getBBaseUrl() + "/medias/app/upload?userguid={{userguid}}&id=-333&method=App_Action_PostPic"
		url = url.stringByReplacingOccurrencesOfString("{{userguid}}", withString: UserData.getMyUG())
		let media = threadModel.objectValue as! MediaM
		threadModel.httpEntyModel.url = url as String
		threadModel.httpEntyModel.method = .Post
		threadModel.httpEntyModel.fileName = media.localFileName
		threadModel.httpEntyModel.uploadPath = media.localFilePath
		threadModel.httpEntyModel.contentType = "image/png"
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess || threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil {
				return
			}
			
			let resultDict = threadMsg.receiveResultDict!
			let message = resultDict["message"] as! String
			media.url = message
		}
	}
	//发话题
	class func operationPostTopicPic(threadModel:COThreadM){
		let medias:[MediaM] = threadModel.arrayValue as? [MediaM] ?? [MediaM]()
		
		var picUrls = ""
		for (index,media) in medias.enumerate(){
			if index > 0 {
				picUrls = picUrls + ","
			}
			picUrls += media.url
		}
		//获取at
		let persons:[PersonM] = threadModel.arrayValue2 as? [PersonM] ?? [PersonM]()
		var atContent = ""
		for (index,person) in persons.enumerate(){
			if index > 0 {
				atContent = atContent + ","
			}
			atContent += "\(person.id)"
		}
		
		setParamsWithBase(threadModel, block: { ( param) -> [String : AnyObject] in
			var param1  = param
			var topicContent = [String:AnyObject]()
			topicContent["topicTitle"] = threadModel.stringValue
			topicContent["topicContent"] = threadModel.stringValue2
			topicContent["atPeople"] = atContent
			//TODO: @谁
//						"atPeople": "28,13848,13849,13858,13895,13898,13912,13988,14025,14036,14104,14142,14173,14190,14193,14196,14202",
			topicContent["picUrls"] = picUrls
			param1["topicContent"] = topicContent
			return param1
		})
		
		
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess || threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil {
				return
			}
		}
	}

	
//	PostTopicPic
	// 获取话题的url
	class func operationGetTopicListUrlById(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (param) -> [String : AnyObject] in
			var param1  = param
			param1["topicId"] = threadModel.intValue ?? 0
			return param1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			
			if !threadMsg.receiveIsSuccess || threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
			let resultDict = threadMsg.receiveResultDict!
			let url = resultDict["url"] as! String
			threadMsg.stringValue = url
		}
	}

	// 查询话题
	class func operationGetTopicByQuery(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { ( param) -> [String : AnyObject] in
			var param1  = param
			param1["queryTitleConditions"] = threadModel.stringValue
//			if threadModel.intValue > 0 {
				param1["queryPersonConditions"] = threadModel.intValue
//			}
			param1["querystartTime"] = threadModel.stringValue2
			param1["queryendTime"] = threadModel.stringValue3
//			"queryTitleConditions":	"网点布防",	//查询条件（根据标题） "queryPersonConditions":1233,	//人员的id（0为所有人） "queryPubDateConditions":"2015-08",	//时间条件年月（""为所有时间内）
			return param1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			
			if !threadMsg.receiveIsSuccess || threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
			
			let resultDict = threadMsg.receiveResultDict!
			//			//获取数组,返回
			let resultList = resultDict["infoList"] as! [NSDictionary]
			var result = [TopicM]()
			for (_,itemDict) in resultList.enumerate(){
				let item = TopicM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}


}
