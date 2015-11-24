//
//  CommentHO.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class CommentHO: BaseHO {
	
	//发评论
	class func operationActionCommentMsg(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { ( param) -> [String : AnyObject] in
			var param1 = param
			param1["id"] = threadModel.intValue
			param1["category"] = threadModel.intValue2
			param1["toUserId"] = threadModel.intValue3
			param1["content"] = threadModel.stringValue
			return param1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
		}
	}
//获取评论列表
	class func operationGetVariousCategoryCommentList(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (param) -> [String : AnyObject] in
			var param1 = param
			param1["id"] = threadModel.intValue
			param1["category"] = threadModel.intValue2
			return param1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess || threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
			
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			let resultList = resultDict["commentList"] as! [NSDictionary]
			var result = [CommentM]()
			for (_,itemDict) in resultList.enumerate(){
				let item = CommentM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}
	
	
	
	//获取评论点赞数
	class func operationGetCommentCoolReadCount(threadModel:COThreadM){
		
		setParamsWithBase(threadModel, block: { (param) -> [String : AnyObject] in
			var param1 = param
			param1["id"] = threadModel.stringValue
			param1["category"] = threadModel.stringValue2
			return param1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			
			if threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			//			var result = resultDict["result"] as! NSDictionary
			let commentCount:Int =  resultDict["commentCount"] as? Int ?? 0
			let coolCount =  resultDict["coolCount"] as? Int ?? 0
			let readCount =  resultDict["readCount"] as? Int ?? 0
			threadModel.intValue = commentCount
			threadModel.intValue2 = coolCount
			threadModel.intValue3 = readCount
		}
	}
	
	//TODO: 获取信息内容
	class func operationGetNewsContent(threadModel:COThreadM){
		
		setParamsWithBase(threadModel, block: { (param) -> [String : AnyObject] in
			var param1 = param
			param1["id"] = threadModel.stringValue
			param1["category"] = threadModel.stringValue2
			return param1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			
			if threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
//			"viewCount": 233,
//			"noticeMe": 0,
//			"relates": [
//			{
//			"url": "/koala/dd/sp",
//			"title": "蜘蛛侠",
//			"id": 11
//			},
//			{
//			"url": "/koala/dd/sp",
//			"title": "蜘蛛侠",
//			"id": 11
//			}
//			],
//			"senderId": 123456,
//			"senderName": "王小米",
//			"body": "赤峰路支行",
//			"coolCount": 100,
//			"title": "侏罗纪公园",
//			"pubDate": "2015-09-15 14:02:53"
		}
	}


}
