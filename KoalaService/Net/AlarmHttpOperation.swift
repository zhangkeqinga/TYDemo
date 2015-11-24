//
//  AlarmHttpOperation.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/23.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//处理报警相关接口

import UIKit

class AlarmHttpOperation: BaseHttpOperation {
	//获取分类数据
	class func operationAlarmTypeCount(threadMolde:COThreadM){
		let alarmTypes = AlarmData.getAlarmTypes()
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			var alarmList = [String]()
			for item in alarmTypes {
				if String.isNotEmpty(item.alarmCode) {
					alarmList.append(item.alarmCode)
				}
			}
			params1["alarmList"] = alarmList
			return params1
		}
		threadMolde.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			//填充数据
			let resultDisct = threadMsg.receiveResultDict!
			let countList:[Int]? = resultDisct["countList"] as? [Int]
			let unreadCountList:[Int]? = resultDisct["unreadCountList"] as? [Int]
			if countList?.count > 0 && unreadCountList?.count > 0 && countList?.count <= alarmTypes.count && unreadCountList?.count <= alarmTypes.count {
				for index in 0...countList!.count-1 {
					let item = alarmTypes[index]
					item.allCount = countList![index]
					item.unReadCount = unreadCountList![index]
				}
			}
		}
	}
	//获取未分类的报警列表
	class func operationAlarmList(threadMolde:COThreadM){
		//page
		//count
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			params1["page"] = threadMolde.intValue ?? 1
			params1["count"] = threadMolde.intValue2 ?? 10
			return params1
		}
		threadMolde.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			var resultList = resultDict["alarmList"] as! [NSDictionary]
			var result = [AlarmM]()
			for (_,itemDict) in enumerate(resultList){
				let item = AlarmM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}
	//分类的报警列表
	class func operationTypeAlarmList(threadMolde:COThreadM){
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			params1["page"] = threadMolde.intValue ?? 1
			params1["count"] = threadMolde.intValue2 ?? 10
			params1["alarmCode"] = threadMolde.stringValue
			return params1
		}
		threadMolde.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			var resultList = resultDict["alarmList"] as! [NSDictionary]
			var result = [AlarmM]()
			for (_,itemDict) in enumerate(resultList){
				let item = AlarmM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}
	
	//查询报警列表
	class func operationGetQueryAlarmList(threadMolde:COThreadM){
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			params1["page"] = threadMolde.intValue ?? 1
			params1["count"] = threadMolde.intValue2 ?? 10
			params1["organizationId"] = threadMolde.intValue3!
			params1["alarmCodeSearch"] = threadMolde.arrayValue2
			params1["startTime"] = threadMolde.stringValue
			params1["endTime"] = threadMolde.stringValue2
			return params1
		}
		threadMolde.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			var resultList = resultDict["alarmList"] as! [NSDictionary]
			var result = [AlarmM]()
			for (_,itemDict) in enumerate(resultList){
				let item = AlarmM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}
	
	//报警详情的评论
	class func operationGetAlarmComment(threadMolde:COThreadM){
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			params1["alarmId"] = threadMolde.intValue!
			params1["replyId"] = threadMolde.intValue2 ?? 0
			return params1
		}
		threadMolde.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess{
				return
			}
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			var resultList = resultDict["commentList"] as! [NSDictionary]
			var result = [AlarmCommentM]()
			for (_,itemDict) in enumerate(resultList){
				let item = AlarmCommentM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}
	//根据id获取报警详情
	class func operationGetAlarmInfoById(threadMolde:COThreadM){
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			params1["alarmId"] = threadMolde.intValue!
			return params1
		}
		threadMolde.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			let alarmM = AlarmM(json: threadMsg.receiveResultDict!)
			threadMolde.objectValue = alarmM
		}
	}
	//获取最新的报警信息
	class func operationGetNewAlarmList(threadMolde:COThreadM){
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			params1["count"] = 6
			return params1
		}
		threadMolde.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			var resultList = resultDict["alarmList"] as! [NSDictionary]
			var result = [AlarmM]()
			for (_,itemDict) in enumerate(resultList){
				let item = AlarmM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}

	}
	//写评论
	class func operationReplyAlarmInfo(threadMolde:COThreadM){
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			params1["alarmId"] = threadMolde.intValue!
			params1["replyId"] = threadMolde.intValue2 ?? 0
			params1["replyId_add"] = threadMolde.intValue3 ?? 0
			params1["content"] = threadMolde.stringValue
			return params1
		}
		threadMolde.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			var resultList = resultDict["commentList"] as! [NSDictionary]
			var result = [AlarmCommentM]()
			for (_,itemDict) in enumerate(resultList){
				let item = AlarmCommentM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
		
	}
	//设置为已读
	class func operationSetAlarmReadStatus(threadMolde:COThreadM){
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			params1["alarmStatusList"] = [["alarmId":threadMolde.intValue!,"readStatus":1]]
			return params1
		}
	}
	
	//获取临时群组
	class func operationTempGroupInfoByAlarmId(threadMolde:COThreadM){
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			params1["alarmId"] = threadMolde.intValue!
			return params1
		}
		threadMolde.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			let resultDict = threadMsg.receiveResultDict!
			//临时群组组号
			//获取数组,返回
			var resultList = resultDict["contactList"] as! [NSDictionary]
			let groupId = resultDict["groupId"] as? NSNumber
			threadMsg.intValue = groupId?.integerValue
			var result = [AlarmContactM]()
			for (_,itemDict) in enumerate(resultList){
				let item = AlarmContactM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
		
	}
	
//	GetAlarmCommentPagingList
	class func operationGetAlarmCommentPagingList(threadMolde:COThreadM){
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			params1["page"] = threadMolde.intValue ?? 1
			
			params1["pageSize"] = 10
			return params1
		}
		threadMolde.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			var resultList = resultDict["commentList"] as! [NSDictionary]
			//{"alarm_id":"2018027","reply_id":"0","sender_id":"14539","sender_name":"天跃考拉","to_name":"","post_time":"2015-08-07 16:53:14","alarm_code":"CA100","alarm_place":"顾北路支行","content":"回"
			
//			var id : Int = 0 //1001,                          //id号
//			var infoType : Int = 0 //0,                           //1报警2布撤防3报警评论
//			var infoId : Int = 0 //12302,                     //所属动态对应Id
//			var createTime : NSString = "" //"2014-09-12 13:38:51",     //动态生成时间
//			var content : NSString = "" //"请立刻处理"   ,               //内容
//			var remark : NSString = "" //"CA100"        //备注解释：infoType为1时，报警类型（火警等）
//			var isRead:Bool = false//是否已读,这是本地属性
//			var userName:NSString = ""//从属于的用户名,这是存储到本地数据库后标示
			var result = [DynamicMessageM]()
			for (_,itemDict) in enumerate(resultList){
				let item = DynamicMessageM(json: NSDictionary())
				item.infoType = 3
				item.infoId = Int((itemDict["alarm_id"] as? NSString ?? "0").intValue)
				item.remark = itemDict["alarm_code"] as? String ?? ""
				item.alarmPlace = itemDict["alarm_place"] as? String ?? ""
				let senderName = itemDict["sender_name"] as? String ?? ""
				item.createTime = itemDict["post_time"] as? String ?? ""
				let content = itemDict["content"] as? String ?? ""
				item.content = "\(senderName) : \(content)"
				result.append(item)
			}
			threadMolde.arrayValue = result
			// 存储到数据库里
			
//			DynamicMessageData.addDynamicMessages(result)
		}

	}
	//获取备用群组
	class func operationGetBenchGroupInfo(threadMolde:COThreadM){
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			params1["organizationId"] = threadMolde.intValue!
			params1["alarmCode"] = threadMolde.stringValue
			return params1
		}
		threadMolde.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			var resultList = resultDict["contactList"] as! [NSDictionary]
			var result = [AlarmContactM]()
			for (_,itemDict) in enumerate(resultList){
				let item = AlarmContactM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}
	//添加到临时群组
	class func operationAddToTempGroup(threadMolde:COThreadM){
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			params1["groupId"] = threadMolde.intValue!
			params1["customList"] = threadMolde.arrayValue
			return params1
		}
	}
	//获取报警类型列表
	class func operationGetAlarmTypeList(threadMolde:COThreadM){
		setParamsWithBase(threadMolde){
			(var params1) -> [String:AnyObject]  in
			return params1
		}
		threadMolde.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			var resultList = resultDict["alarmTypeList"] as! [NSDictionary]
			var result = [AlarmTypeM]()
			for (_,itemDict) in enumerate(resultList){
				let item = AlarmTypeM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}
	//拉去动态信息
//	class func operationGetDynamicInfo(threadMolde:COThreadM){
//		setParamsWithBase(threadMolde){
//			(var params1) -> [String:AnyObject]  in
//			return params1
//		}
//		threadMolde.setReceiveToBackgourBlock { (threadMsg) -> Void in
//			if !threadMsg.receiveIsSuccess {
//				return
//			}
//			let resultDict = threadMsg.receiveResultDict!
//			//获取数组,返回
//			var resultList = resultDict["infoList"] as! [NSDictionary]
//			var result = [DynamicMessageM]()
//			for (_,itemDict) in enumerate(resultList){
//				let item = DynamicMessageM(json: itemDict)
//				result.append(item)
//			}
			// 存储到数据库里

//			DynamicMessageData.addDynamicMessages(result)
//		}
//	}
}
